define [
    'underscore'
    'backbone'
], (_, Backbone) ->

    'use strict';

    class UserModel extends Backbone.Model

        baseUrl: '/api/v1/'

        getAll: (verb_type) ->
            @baseUrl + @type + '/' + @id + '/' + verb_type

