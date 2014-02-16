define [
    'underscore'
    'jquery'
    'backbone'
    'models/actor'
    'models/verb'
    'models/object'
], (_, $, Backbone, ActorModel, VerbModel, ObjectModel) ->
    
    root = exports ? this

    'use strict';

    class root.ActivityModel extends Backbone.Model
        # Will have to remove these defaults once we're set up
        dfd: new $.Deferred()

        initialize: ->
            @models = {}
            @models.actor = new ActorModel(arguments[0].actor)
            @models.verb = new VerbModel(arguments[0].verb)
            @models.object = new ObjectModel(arguments[0].object)
            @grab(@dfd)

        grab: ->
            $.when(@models.actor.fetch(), @models.object.fetch()).then($.proxy( ->
                @dfd.resolve(@)
            , @))

        toJSON: ->
            obj = {}
            obj.actor = @models.actor.attributes
            obj.object = @models.object.attributes
            obj.verb = @models.verb.attributes
            return obj

