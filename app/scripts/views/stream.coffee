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
            _.bindAll @, 'render', 'page', 'ready', 'error', 'addActivity', 'appendActivity', 'sortActivities'

            @collection = new StreamCollection
            @collection.bind 'add', @appendActivity
            @collection.bind 'sort', @sortActivities

            window.collection = @collection

            @render()

        render: ->
            $(@el).append @template

        page: ->
            console.log('asked for more items')

        ready: ->
            $(@el).find('#JS_activitypending').remove()

        error: (errmsg) ->
            $(@el).find('#JS_activitypending').text(errmsg)

        addActivity: (activity) ->
            activityModel = new ActivityModel(activity)
            $.when(activityModel.dfd).then($.proxy( () ->
                @collection.add activityModel
            , @))

        appendActivity: (activity) ->
            activity_view = new ActivityView model: activity, className: 'activitystream-item ' + activity.cid
            $(@el).find('#JS_activitystream').append activity_view.render().el

        sortActivities: (collection, updates) ->
            $el = $(@el).find('#JS_activitystream')
            for key, model of collection.models
                if collection.models.length > 1  
                    if key == '0'
                        $cel = $el.find('.' + model.cid)
                        $el.prepend($cel)
                    else if key == (collection.models.length-1).toString()
                        $cel = $el.find('.' + model.cid)
                        $el.prepend($cel)
                    else
                        $cel = $el.find('.' + model.cid).detach()
                        $pel = $el.find('.' + collection.models[key-1].cid)
                        $pel.before($cel)
            return true
                
        events:
            'click .activity.show--more': 'page'