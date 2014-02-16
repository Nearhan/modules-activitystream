define [
    'underscore'
    'backbone'
], (_, Backbone) ->

    root = exports ? this

    'use strict';

    class root.UserModel extends Backbone.Model

        baseUrl: '/api/v1/'

        getAll: (verb_type) ->
            @baseUrl + @type + '/' + @id + '/' + verb_type

