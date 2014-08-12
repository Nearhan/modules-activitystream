define [
    'jquery'
    'underscore'
    'backbone'
    'templates'
], ($, _, Backbone, JST) ->

    class ActivityView extends Backbone.View
        template: JST['app/scripts/templates/activity.hbs']

        tagName: 'li'

        initialize: ->
            _.bindAll @, 'render'

        render: ->
            @className = @className + ' ' + @model.cid
            $(@el).html @template(@model.toJSON())

            @
