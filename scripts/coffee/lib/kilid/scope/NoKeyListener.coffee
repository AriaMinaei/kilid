_Listener = require './_Listener'

module.exports = class NoKeyListener extends _Listener

	constructor: (scope) ->

		super

		@_wasStarted = no

	_handleKeydown: (e) ->

		return unless @_wasStarted

		@_wasStarted = no

		if @_endCallback?

			do @_endCallback

		return

	_handleKeyup: (e) ->

		if @_wasStarted

			console.log 'NoKeyListener is already in "started" mode but has recieved a keyup event'

			return

		return unless @_kilid._keysCurrentlyDown.length is 0

		@_wasStarted = yes

		if @_startCallback?

			do @_startCallback

		return