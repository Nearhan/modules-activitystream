#/*global require*/

'use strict'

# Main RequireJS properties loaded on init:
require.config
    deps: ['main']
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
