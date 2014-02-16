define [
  'underscore'
  'backbone'
  'models/activity'
], (_, Backbone, ActivityModel) ->
    root = exports ? this

    class root.StreamCollection extends Backbone.Collection
        model: ActivityModel
        url: '/stream/'
