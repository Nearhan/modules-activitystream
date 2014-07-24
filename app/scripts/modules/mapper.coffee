define [
	'modules/config'
	], (config) ->
	'use strict'

	class APIMapper
		constructor: (map, object) ->
			throw new Error('Undefined API map') unless config.mapper and config.mapper[map]  
      @mappedObj = {}

      for own key, value of object
          if key of map
            @mappedObj[map[key]] = value
      
      @mappedObj