define [
    'underscore'
    'backbone'
    'modules/config'
], (_, Backbone, config) ->
    
    'use strict';

    class ComponentModel extends Backbone.Model

        # constructor: (data) ->
        #     console.log(data)


        initialize: ->
            @type = @get('data').type

        url: ->
            return @get('data').api

        fetch: ->
            options = {}
            if config.api[@type]
                options = config.api[@type]
            else
                options.xhrFields = withCredentials: true # Should this be default?
            console.log(options)
            console.log('trying to grab ', @type)
            Backbone.Model::fetch.call @, options
