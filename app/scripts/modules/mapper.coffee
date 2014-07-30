define [
	'modules/config'
], (config) ->
	'use strict'

	###
	 # The Mapper class returns a flat object based on properties found in another object
	 # the properties of the object are defined in a 'map' which gives the mapper the
	 # names of the keys and what values to set
	 # @param  {String} appname_model An AS spec descriptor of the origin
	 # @param  {Object} object The object you would like to map into the flat map
	 # @return {Object} map A flattened object
	###
	
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

			