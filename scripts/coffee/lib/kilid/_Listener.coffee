module.exports = class _Listener

	constructor: ->

		@_endCallback = null

		@_startCallback = null

		@_locked = no

		setTimeout =>

			@_locked = yes

		, 0

	detach: ->

		@_kilid._detachListener @

		@_kilid = null

		return

	onEnd: (cb) ->

		@_endCallback = cb

		@

	onStart: (cb) ->

		@_startCallback = cb

		@