define [
  'underscore'
  'backbone'
  'config'
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
      x = Backbone.Model::fetch.call @, options
      x.done($.proxy( ->
        console.log '@->',@.cid, @
      , @))

    # sync: ->
    #   console.log arguments
