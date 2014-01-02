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
    el: $ 'div.activitystream'
    self: @

    initialize: ->
        _.bindAll @

        @collection = new StreamCollection
        @collection.bind 'add', @appendActivity

        @render()

    render: ->
        $(@el).append @template

    page: ->
        console.log('asked for more items')

    ready: ->
        $(@el).find('div.activitystream__pending').remove()

    addActivity: (activity) ->
        activity.collection = @collection
        activityModel = new ActivityModel(activity)
        $.when(activityModel.dfd).done (activityModel) ->
            activityModel.collection.add activityModel

    appendActivity: (activity) ->
        console.log 'appending', activity.attributes.actor
        activity_view = new ActivityView model: activity
        $(@el).find('ul.activitystream__list').append activity_view.render().el

    events:
        'click .activity.show--more': 'page'
