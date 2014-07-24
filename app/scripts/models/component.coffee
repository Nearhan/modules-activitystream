define [
    'jquery'
    'underscore'
    'backbone'
    'modules/config'
    'modules/storage'
    'modules/mapper'
], ($, _, Backbone, config, storage, Mapper) ->
    
    'use strict';

    class ComponentModel extends Backbone.Model

        initialize: ->
            @type = @get('data').type

        url: ->
            return @get('data').api

        fetch: ->
            model = @
            options = {}
            # Are we grabbing from localStorage
            store = ( model, resp, options ) ->
                map = new Mapper(model.type, resp)
                console.log('map',map)
                storage.set 'AS/'+model.type+'/'+model.get('data').aid, JSON.stringify resp

            success = ( resp ) ->
                if not model.set( model.parse( resp, options ), options ) then return false
                if options.success then options.success model, resp, options
                model.trigger 'sync', model, resp, options

            if resp = storage.get 'AS/'+@type+'/'+@get('data').aid
                # assign success callback
                options.success = store
                resp = JSON.parse resp
                success resp
                return new $.Deferred().resolve resp

            # Or getting from ajax
            if config.api[@type]
                options = config.api[@type]
                # re-assign success callback
                options.success = store
            else
                options.xhrFields = withCredentials: true # Should this be default?

            Backbone.Model::fetch.call @, options