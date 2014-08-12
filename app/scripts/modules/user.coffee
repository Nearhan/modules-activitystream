define [
    'underscore'
    'modules/config'
], (_, config) ->

    'use strict';

    class User

        constructor: (args) ->
            @type = args.type
            @id = args.id

        getAll: () ->
            # Gets a list of all activites for a given user
            # {@type} = user type (i.e. mmdb_user, etc.)
            # {@id} = MMDB user id
            config.baseUrl + "actor/#{@type}/#{@id}/activities"

        getAllVerb: (verbType) ->
            # Gets a list of all activities for a given user based on the verb
            # Examples of verbs:  favorited, liked, followed, etc.
            # {@type} = user type (i.e. mmdb_user, etc.)
            # {@id} = MMDB user id
            # verbType = favorited, followed, liked, etc.
            config.baseUrl + "actor/#{@type}/#{@id}/" + verbType

        getFollowing: () ->
            # Gets a list of all activites for the followed users
            # of the given user
            # {@type} = user type (i.e. mmdb_user, etc.)
            # {@id} = user id
            config.baseUrl + "proxy/#{@type}/#{@id}/"
