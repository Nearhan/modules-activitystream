define [
    'underscore'
    'backbone'
    'modules/config'
], (_, Backbone, config) ->
    
    'use strict';

    class ComponentModel extends Backbone.Model

        initialize: ->
            @type = @get('data').type

        url: ->
            return @get('data')[@type + '_api']

        fetch: ->
            options = {}
            if config.api[@type]
                options = config.api[@type]
            else
                options.xhrFields = withCredentials: true # Should this be default?
            Backbone.Model::fetch.call @, options
