define [
  'underscore'
  'backbone'
  'models/activity'
], (_, Backbone, ActivityModel) ->

    class StreamCollection extends Backbone.Collection
        model: ActivityModel
        url: '/stream/'
        comparator: (a,b) ->
          # console.log a,b
          a = a.attributes.verb.data.created
          b = b.attributes.verb.data.created
          if (a > b)
            order = 1
          else if (a < b)
            order = -1
          else
            order = 0

          return order

        initialize: () ->
          # @sort()
          # console.log @models
