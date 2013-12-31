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
