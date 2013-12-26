#/*global require*/
'use strict'

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
  paths:
    jquery: '../bower_components/jquery/jquery'
    backbone: '../bower_components/backbone/backbone'
    underscore: '../bower_components/underscore/underscore'
    handlebars: '../bower_components/handlebars/handlebars'
    models: '/scripts/models'
    views: '/scripts/views'
    collections: '/scripts/collections'

require [
  'backbone'
  'models/activity'
  'views/activity'
  'views/stream'
  'collections/stream'
], (Backbone) ->
  Backbone.history.start()

  console.log('ready')
