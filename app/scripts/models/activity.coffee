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
      defaults:
        actor: 'someapp_somemodel'

      model:
        actor: ActorModel
        verb: VerbModel
        object: ObjectModel

      parse: (response) ->
        for key of @model
          embeddedClass = @model[key]
          embeddedData = response[key]
          response[key] = new embeddedClass(embeddedData,
            parse: true
          )
        response
