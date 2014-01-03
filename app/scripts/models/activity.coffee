define [
  'underscore'
  'jquery'
  'backbone'
  'models/actor'
  'models/verb'
  'models/object'
], (_, $, Backbone, ActorModel, VerbModel, ObjectModel) ->
  'use strict';

  class ActivityModel extends Backbone.Model
      # Will have to remove these defaults once we're set up
    dfd: new $.Deferred()

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
      console.log @.cid, @models.object.cid, '<========='
      @grab(@dfd)

    # parse: (response) ->
    #   for key of @model
    #     embeddedClass = @model[key]
    #     embeddedData = response[key]
    #     response[key] = new embeddedClass(embeddedData,
    #       parse: true
    #     )
    #   response

    grab: ->
        $.when(@models.actor.fetch(), @models.object.fetch()).then($.proxy( () ->
            console.log '========>', @.cid, @models.actor.cid
            console.log '========>', @.cid, @models.object.cid
            @dfd.resolve(@)
        , @))

    toJSON: ->
        obj = {}
        obj.actor = @models.actor.attributes
        obj.object = @models.object.attributes
        obj.verb = @models.verb.attributes
        return obj

