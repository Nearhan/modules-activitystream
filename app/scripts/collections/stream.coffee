define [
  'underscore'
  'backbone'
  'models/activity'
], (_, Backbone, ActivityModel) ->

  class StreamCollection extends Backbone.Collection
    model: ActivityModel
