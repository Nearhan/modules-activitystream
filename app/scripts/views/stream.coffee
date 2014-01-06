define [
  'jquery'
  'underscore'
  'backbone'
  'templates'
  'collections/stream'
  'models/activity'
  'views/activity'
], ($, _, Backbone, JST, StreamCollection, ActivityModel, ActivityView) ->
  class StreamView extends Backbone.View
    template: JST['app/scripts/templates/stream.hbs']
    el: $ '#JS_activitycontainer'

    initialize: ->
        _.bindAll @

        @collection = new StreamCollection
        @collection.bind 'add', @appendActivity

        window.collection = @collection

        @render()

    render: ->
        $(@el).append @template

    page: ->
        console.log('asked for more items')

    ready: ->
        $(@el).find('#JS_activitypending').remove()

    addActivity: (activity) ->
      activityModel = new ActivityModel(activity)
      $.when(activityModel.dfd).then($.proxy( () ->
        @collection.add activityModel
      , @))

    appendActivity: (activity) ->
        activity_view = new ActivityView model: activity
        $(@el).find('#JS_activitystream').append activity_view.render().el

    events:
        'click .activity.show--more': 'page'
