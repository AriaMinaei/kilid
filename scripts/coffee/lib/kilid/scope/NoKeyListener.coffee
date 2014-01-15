_Listener = require './_Listener'

module.exports = class NoKeyListener extends _Listener

	constructor: (scope) ->

		super

		@_wasStarted = no

		setTimeout =>

			unless @_wasStarted then do @_recheck

		, 0

	_recheck: ->

		if @_wasStarted

			console.log '_recheck ws called when NoKeyListener was already started'

			return

		return unless @_kilid._keysCurrentlyDown.length is 0

		@_wasStarted = yes

		if @_startCallback?

			do @_startCallback

		return

	_handleKeydown: (e) ->

		return unless @_wasStarted

		@_wasStarted = no

		if @_endCallback?

			do @_endCallback

		return

	_handleKeyup: (e) ->

		if @_wasStarted

			# console.log 'NoKeyListener is already in "started" mode but has recieved a keyup event'

			return

		return unless @_kilid._keysCurrentlyDown.length is 0

		@_wasStarted = yes

		if @_startCallback?

			do @_startCallback

		return

	detach: ->

		if @_wasStarted and @_endCallback?

			do @_endCallback

		super

		return

	_forceEnd: ->

		return unless @_wasStarted

		@_wasStarted = no

		if @_endCallback?

			do @_endCallback

		return