_Listener = require './_Listener'

module.exports = class ComboListener extends _Listener

	constructor: (scope, @_combo, args) ->

		super

		@_isExclusive = yes

		@_hitCallback = null

		@_preventDefault = yes

		if typeof args[0] is 'function'

			@onHit args[0]

	preventDefault: ->

		@_preventDefault = yes

		@

	allowDefault: ->

		@_preventDefault = no

		@

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

			if keyCode.length?

				x1 = keyCode[0] in @_kilid._keysCurrentlyDown
				x2 = keyCode[1] in @_kilid._keysCurrentlyDown

				return x1 or x2

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

		if e? and @_preventDefault then e.preventDefault()

		if @_hitCallback?

			@_hitCallback e

		return

	_fireEnd: (e) ->

		if e? and @_preventDefault then e.preventDefault()

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

	detach: ->

		if @_wasDown then @_fireEnd()

		super

		return

	_forceEnd: ->

		return unless @_wasDown

		do @_fireEnd

		return

	_recheck: ->

		if @_wasDown

			console.warn '_recheck ws called when ComboListener was already down'

			return

		do @_handleKeydown

		return