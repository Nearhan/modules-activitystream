define [
    'jquery'
    'underscore'
    'backbone'
    'templates'
], ($, _, Backbone, JST) ->
    root = exports ? this

    class root.ActivityView extends Backbone.View
        template: JST['app/scripts/templates/activity.hbs']

        tagName: 'li'

        className: 'activitystream-item'

        initialize: ->
            window.activityView = this
            _.bindAll @

        render: ->
            $(@el).html @template(@model.toJSON())

            @
