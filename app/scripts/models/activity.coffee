define [
  'underscore'
  'backbone'
  'models/actor'
  'models/verb'
  'models/object'
], (_, Backbone, ActorModel, VerbModel, ObjectModel) ->
  'use strict';

  class ActivityModel extends Backbone.Model
      # Will have to remove these defaults once we're set up
    models:
      actor: null
      verb: null
      object: null
      target: null
      context: null

    initialize: ->
      @models.actor = new ActorModel(arguments[0].actor)
      @models.verb = new VerbModel(arguments[0].verb)
      @models.object = new ObjectModel(arguments[0].object)
      window.model = this
      @grab()

    parse: (response) ->
      for key of @model
        embeddedClass = @model[key]
        embeddedData = response[key]
        response[key] = new embeddedClass(embeddedData,
          parse: true
        )
      response

    grab: ->
      _.each @models, (value, key, list) ->
        # type = value.get('data').type
        api = 'http://mc.dev.nationalgeographic.com:8000/user/1/' # value.get('data')[type + '_api']
        $.ajax(
          url: api
          type: "GET"
          dataType: "json"
          xhrFields:
            withCredentials: true
        ).done (data) ->
          value.set data

        console.log value, key
