define [
	'modules/config'
	], (config) ->
	'use strict'

	class ApiMapper
		constructor: (map, object) ->
			throw new Error('Undefined API map') unless config.mapper and config.mapper[map]
			config.mapper[map].call(object)
