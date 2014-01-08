array = require 'utila/scripts/js/lib/array'

module.exports = class Kilid

	constructor: (@rootNode = document) ->

		@rootNode.addEventListener 'keydown', @_keydown

		@rootNode.addEventListener 'keyup', @_keyup

		@_keysCurrentlyDown = []

	_keydown: (e) =>

		if @_keysCurrentlyDown.indexOf(e.keyCode) is -1

			@_keysCurrentlyDown.push e.keyCode

		console.log @_keysCurrentlyDown

	_keyup: (e) =>

		console.log 'up'

		array.pluckOneItem @_keysCurrentlyDown, e.keyCode

		console.log @_keysCurrentlyDown