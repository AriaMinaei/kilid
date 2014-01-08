_Listener = require './_Listener'

module.exports = class ComboListener extends _Listener

	constructor: (@_kilid, @_combo) ->

		super

		@_isExclusive = yes

		@_hitCallback = null

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

			@_fireHit e

			return

		if @_comboIsDown()

			@_fireHit e

			@_fireStart e

		return

	_handleKeyupForInclusive: (e) ->

		return unless @_wasDown

		unless @_comboIsDown()

			@_fireEnd e

		return

	_handleKeydownForExclusive: (e) ->

		if @_wasDown

			if @_comboIsExclusivelyDown()

				@_fireHit e

			else

				@_fireEnd e

		else

			return unless @_comboIsExclusivelyDown()

			@_fireHit e

			@_fireStart e

		return

	_handleKeyupForExclusive: (e) ->

		if @_wasDown

			@_fireEnd e

		else

			return unless @_comboIsExclusivelyDown()

			@_fireHit e

			@_fireStart e

		return

	_fireHit: (e) ->

		if @_hitCallback?

			@_hitCallback e

		return

	_fireEnd: (e) ->

		@_wasDown = no

		if @_endCallback?

			@_endCallback e

		return

	_fireStart: (e) ->

		@_wasDown = yes

		if @_startCallback?

			@_startCallback e

		return

	onHit: (cb) ->

		@_hitCallback = cb

		@