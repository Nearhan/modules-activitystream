define [
    'underscore'
    'config'
], (_, config) ->
    root = exports ? this

    'use strict';

    class root.User

        constructor: (args) ->
            @type = args.type
            @id = args.id

        getAll: () ->
            # Gets a list of all activites for a given user
            # {@type} = user type (i.e. mmdb_user, etc.)
            # {@id} = MMDB user id
            config.baseUrl + "#{@type}/#{@id}/activities"

        getAllVerb: (verbType) ->
            # Gets a list of all activities for a given user based on the verb
            # Examples of verbs:  favorited, liked, followed, etc.
            # {@type} = user type (i.e. mmdb_user, etc.)
            # {@id} = MMDB user id
            # verbType = favorited, followed, liked, etc.
            config.baseUrl + "#{@type}/#{@id}/" + verbType
