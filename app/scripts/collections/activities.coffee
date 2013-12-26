define [
  'underscore'
  'backbone'
  'models/Activities-model'
], (_, Backbone, ActivitiesModel) ->

  class ActivitiesCollection extends Backbone.Collection
    model: ActivitiesModel