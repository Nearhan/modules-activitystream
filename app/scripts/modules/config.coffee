define [
	'localconfig'
	'underscore'
], (overrides, _) ->
	
	'use strict'

	class Config
		constructor: () ->
			@conf = @extend({}, @defaults, overrides)

		extend: (args...) ->
			return {} unless args[0]
			for i of args
				for own key, val of args[i]
					if not args[0][key]? and typeof val isnt 'object'
						args[0][key] = val
					else if args[0][key]? and typeof val isnt 'object'
						continue
					else
						args[0][key] = {} unless args[0][key]?
						args[0][key] = @extend args[0][key], val
			args[0]
		
		defaults:
			baseUrl: 'as.dev.nationalgeographic.com:9365/api/v1/'

		mapper:
			yourshot_photo:
				'small-320' : 'photo'
				title: 'title'


	return new Config().conf
