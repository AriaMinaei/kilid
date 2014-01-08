Scope = require './kilid/Scope'
array = require 'utila/scripts/js/lib/array'

module.exports = class Kilid

	constructor: (@rootNode = document, @id = 'kilid') ->

		@rootNode.addEventListener 'keydown', @_keydown

		@rootNode.addEventListener 'keyup', @_keyup

		@_keysCurrentlyDown = []

		@_rootScope = new Scope null, @, @id

		@_activeScope = null

		@_rootScope.activate()

	_setActiveScope: (scope) ->

		if @_activeScope?

			@_activeScope._notActiveAnymore()

		@_activeScope = scope

		return

	getRootScope: ->

		@_rootScope

	_keydown: (e) =>

		if @_keysCurrentlyDown.indexOf(e.keyCode) is -1

			@_keysCurrentlyDown.push e.keyCode

		@_activeScope._keydown e

		return

	_keyup: (e) =>

		array.pluckOneItem @_keysCurrentlyDown, e.keyCode

		@_activeScope._keyup e

		return