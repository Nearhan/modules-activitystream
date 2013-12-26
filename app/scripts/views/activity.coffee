define [
  'jquery'
  'underscore'
  'backbone'
  'templates'
], ($, _, Backbone, JST) ->
  class ActivityView extends Backbone.View
    template: JST['app/scripts/templates/activity.hbs']

    tagName: 'li'
    
    className: 'activitystream__item'

    initialize: ->
        _.bindAll @

    render: ->
        $(@el).html @template(@model.toJSON())

        @
