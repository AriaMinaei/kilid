ComboListener = require './scope/ComboListener'
NoKeyListener = require './scope/NoKeyListener'
map = require './map'

module.exports = class Scope

	constructor: (@parent, @_kilid, @name) ->

		@id = if @parent? then @parent.id + '-' + @name else @name

		@_bubbles = no

		@_listeners = []

		@_isActive = no

		@_children = []

	_keydown: (e) ->

		for listener in @_listeners

			listener._handleKeydown e

		if @_bubbles and @parent?

			@parent._keydown e

		return

	_keyup: (e) ->

		for listener in @_listeners

			listener._handleKeyup e

		if @_bubbles and @parent?

			@parent._keyup e

		return

	bubble: ->

		@_bubbles = yes

		@

	dontBubble: ->

		@_bubbles = no

		@

	on: (combo) ->

		ar = @_comboToArray combo

		unless ar

			combo = new NoKeyListener @

		else

			combo = new ComboListener @, ar

		@_listeners.push combo

		combo

	_comboToArray: (combo) ->

		unless typeof combo is 'string'

			throw Error "Combo must be a string"

		combo = combo.trim().replace /\s+/, ' '

		return false if combo.length is 0

		combo.split(/\s*\+\s*/)

		.map (name) => map.keyCodeByName[name]|0

	_detachListener: (listener) ->

		array.pluckOneItem @_listeners, listener

		return

	getScope: (name) ->

		unless @_children[name]?

			@_children[name] = new Scope @, @_kilid, name

		@_children[name]

	activate: ->

		if @_isActive

			throw Error "Scope is already active"

		@_kilid._setActiveScope @

		@_isActive = yes

		@

	deactivate: ->

		unless @_isActive

			throw Error "Scope is not active to be deactivated"

		unless @parent?

			throw Error "Cannot deactivate the root scope"

		@parent.activate()

		@

	_notActiveAnymore: ->

		unless @_isActive

			throw Error "Called _notActiveAnymore() when scope is not active"

		@_isActive = no

		return