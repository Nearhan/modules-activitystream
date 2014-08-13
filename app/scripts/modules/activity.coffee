define [
    'models/activity',
], (ActivityModel) ->

    'use strict';

    class Activity
        constructor: (@stream) ->

        parseMessage: (message, verb) ->
            switch verb
                when 'create' then @create(message)
                when 'destroy' then @remove(message)
                when 'update' then @update(message)

        create: (message) ->
            @stream.addActivity(message)

        remove: (message) ->
            console.log message.verb + message.id

        update: (message) ->
            console.log message