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
    # tagName: 'div'
    # className: 'activity-stream'
    el: $ 'body'

    initialize: ->
        _.bindAll @

        @collection = new StreamCollection
        @collection.bind 'add', @appendActivity

        @render()

    render: ->
        $(@el).append '<button>Add an Activity</button>'
        $(@el).append '<ul><li>Hello, Backbone!</li></ul>'

    page: ->
        console.log('asked for more items')

    appendActivity: (activity) ->
        activity = new ActivityModel
        activity.set actor_type: "#{activity.get 'actor'}"
        activity_view = new ActivityView model: activity
        $(@el).append activity_view.render().el

    events:
        'click .activity.show--more': 'page'
        'click button': 'appendActivity'


  stream_view = new StreamView
