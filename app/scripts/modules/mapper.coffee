define [
	'modules/config'
], (config) ->
	'use strict'

	class Mapper
		constructor: (type, object) ->
			unless config.api[type] and config.api[type].map
				throw new Error(type+':Undefined API map')
			@type = type
			@base = config.api[@type].map
			@map = {}
			@drill object
			return @map

		drill: (object) ->
			obj = {}
			for own key, value of object
				if key of @base
					if typeof @base[key] is 'object'
						@base = @base[key]
						obj[key] = @drill object[key]
					else
						# Set everything on the @map object
						@map[@base[key]] = value

			# Reset base to the top most tree after a recursion
			@base = config.api[@type].map
			return obj

			