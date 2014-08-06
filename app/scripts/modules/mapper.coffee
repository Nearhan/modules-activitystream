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
            return @drill object

        drill: (object) ->
            console.log("Asfgadfgadfgafgafgadfg")
            for own key, value of @base
                obj = object
                while typeof value is 'object'
                    obj = obj[Object.keys(value)[0]]
                    value = value[Object.keys(value)[0]]
                if typeof value is 'string'
                    if value of obj
                        console.log(obj[value])
                        @map[key] = obj[value]
                else if typeof value is 'function'
                    @map[key] = value obj

            return @map
