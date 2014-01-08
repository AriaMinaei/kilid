map = require './kilid/map'
array = require 'utila/scripts/js/lib/array'
ComboListener = require './kilid/ComboListener'
NoKeyListener = require './kilid/NoKeyListener'

module.exports = class Kilid

	constructor: (@rootNode = document) ->

		@rootNode.addEventListener 'keydown', @_keydown

		@rootNode.addEventListener 'keyup', @_keyup

		@_keysCurrentlyDown = []

		@_listeners = []

	_keydown: (e) =>

		if @_keysCurrentlyDown.indexOf(e.keyCode) is -1

			@_keysCurrentlyDown.push e.keyCode

		for listener in @_listeners

			listener._handleKeydown e

		return

	_keyup: (e) =>

		array.pluckOneItem @_keysCurrentlyDown, e.keyCode

		for listener in @_listeners

			listener._handleKeyup e

		return

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