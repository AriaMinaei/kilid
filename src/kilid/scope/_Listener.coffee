module.exports = class _Listener

	constructor: (@_scope) ->

		@_kilid = @_scope._kilid

		@_endCallback = null

		@_startCallback = null

		@_locked = no

		setTimeout =>

			@_locked = yes

		, 0

	detach: ->

		@_scope._detachListener @

		@_scope = null

		@_kilid = null

		return

	onEnd: (cb) ->

		@_endCallback = cb

		@

	onStart: (cb) ->

		@_startCallback = cb

		@

