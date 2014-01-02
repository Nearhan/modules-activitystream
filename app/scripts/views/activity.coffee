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
        # console.log @model.toJSON()
        window.activityView = this
        _.bindAll @

    render: ->
        console.log 'view', @model.toJSON()
        $(@el).html @template(@model.toJSON())

        @
