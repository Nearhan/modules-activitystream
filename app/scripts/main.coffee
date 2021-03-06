#/*global require*/

'use strict'

# Main RequireJS properties loaded on init:
require.config
    shim:
        underscore:
            exports: '_'
        backbone:
            deps: [
                'underscore'
                'jquery'
            ]
            exports: 'Backbone'
        handlebars:
            exports: 'Handlebars'
        sailsio:
            deps: [
                'io'
            ]
            exports: 'io'
    paths:
        jquery: '../bower_components/jquery/jquery'
        backbone: '../bower_components/backbone/backbone'
        underscore: '../bower_components/underscore/underscore'
        handlebars: '../bower_components/handlebars/handlebars'
        io: '../bower_components/socket.io-client/dist/socket.io'
        sailsio: '/scripts/vendor/sails.io/sails.io'
        models: '/scripts/models'
        views: '/scripts/views'
        collections: '/scripts/collections'
        modules: '/scripts/modules',
        localconfig: '/scripts/localconfig'

require [
    'backbone'
    'modules/activityStream'
    'modules/helpers'
    'modules/storage'
], (Backbone, ActivityStreamModule, helpers, storage) ->
    Backbone.history.start()
    
    if typeof _TEST_MODE is "undefined" # not sure what this is
        # Not in test mode, initiate the module
        window.AS = new ActivityStreamModule()

        # settings that an implementing site
        # would use to instantiate the module

        testUserObj =
            user:
                type: 'mmdb_user'
                id: '9734900'

        window.AS.ready(testUserObj)
        
        # Different socket events will probably have to be handled
        # in a module that gets instantiated here
        # socket.on "message", messageReceived = (message) ->
            # logger.log "New comet message received :: ", message
            # $.each message.data.object.data, (l, m) ->
            #   logger.log l, m
            #   if l is ("yourshot_photo_id")
            #   hearts = $("#" + m + " i")
            #   $("a").find(hearts).toggleClass "chosen"
