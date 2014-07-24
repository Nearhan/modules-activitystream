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
			@map = @drill object
			return @map

		drill: (object) ->
			obj = {}
			for own key, value of object
				if key of @base
					console.log 'base',@base[key]
					if typeof @base[key] is 'object'
						@base = @base[key]
						obj[key] = @drill object[key]
					else
						obj[@base[key]] = value
			console.log(obj)
			return obj

			