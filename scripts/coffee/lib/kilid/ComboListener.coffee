module.exports = class ComboListener

	constructor: (@_kilid, @_combo) ->

		@_downCallback = null

		@_upCallback = null

		@_holdCallback = null

		@_isExclusive = yes

		@_locked = no

		setTimeout =>

			@_locked = yes

		, 0

	beInclusive: ->

		if @_locked

			throw Error "You can only modify combo listeners on the same tick they were introduced"

		@_isExclusive = no

		@

	beExclusive: ->

		if @_locked

			throw Error "You can only modify combo listeners on the same tick they were introduced"

		@_isExclusive = yes

		@

	_comboIsDown: ->

		for keyCode in @_combo

			return no unless keyCode in @_kilid._keysCurrentlyDown

		yes

	_comboIsExclusivelyDown: ->

		return no unless @_comboIsDown()

		@_combo.length is @_kilid._keysCurrentlyDown.length

	_handleKeyup: (e) ->

		if @_isExclusive

			@_handleKeyupForExclusive e

		else

			@_handleKeyupForInclusive e

		return

	_handleKeydown: (e) ->

		if @_isExclusive

			@_handleKeydownForExclusive e

		else

			@_handleKeydownForInclusive e

		return

	_handleKeydownForInclusive: (e) ->

		if @_wasDown

			@_fireKeydown e

			return

		if @_comboIsDown()

			@_fireKeydown e

			@_fireKeyHold e

		return

	_handleKeyupForInclusive: (e) ->

		return unless @_wasDown

		unless @_comboIsDown()

			@_fireKeyup e

		return

	_handleKeydownForExclusive: (e) ->

		if @_wasDown

			if @_comboIsExclusivelyDown()

				@_fireKeydown e

			else

				@_fireKeyup e

		else

			return unless @_comboIsExclusivelyDown()

			@_fireKeydown e

			@_fireKeyHold e

		return

	_handleKeyupForExclusive: (e) ->

		if @_wasDown

			@_fireKeyup e

		else

			return unless @_comboIsExclusivelyDown()

			@_fireKeydown e

			@_fireKeyHold e

		return

	_fireKeydown: (e) ->

		if @_downCallback?

			@_downCallback e

		return

	_fireKeyup: (e) ->

		@_wasDown = no

		if @_upCallback?

			@_upCallback e

		return

	_fireKeyHold: (e) ->

		@_wasDown = yes

		if @_holdCallback?

			@_holdCallback e

		return

	onDown: (cb) ->

		@_downCallback = cb

		@

	onUp: (cb) ->

		@_upCallback = cb

		@

	onHold: (cb) ->

		@_holdCallback = cb

		@

	detach: ->

		@_kilid._detachListener @

		@_kilid = null

		return