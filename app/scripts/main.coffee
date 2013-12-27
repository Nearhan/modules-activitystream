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
    io: '/scripts/vendor/socket.io/socket.io'
    sailsio: '/scripts/vendor/sails.io/sails.io'
    models: '/scripts/models'
    views: '/scripts/views'
    collections: '/scripts/collections'
    modules: '/scripts/modules'

require [
  'backbone'
  'jquery'
  'sailsio'
  'config'
  'modules/logger'
  'views/stream'
  'models/activity'
  'views/activity'
  'collections/stream'
], (Backbone, $, io, config, Logger, StreamView) ->
  Backbone.history.start()

  # Base Init
  logger = new Logger()

  # Init Socket Connection
  logger.log "Connecting to Activity Streams Service..."
  socket = io.connect(config.activityStreamServiceAPI)

  socket.on "connect", socketConnected = ->
    logger.log "Connected;"
    socket.get '/api/v1/mmdb_user/1/FAVORITED', (data) ->
        logger.log data

  # Different socket events will probably have to be handled
  # in a module that gets instantiated here
  # socket.on "message", messageReceived = (message) ->
        # logger.log "New comet message received :: ", message
        # $.each message.data.object.data, (l, m) ->
        #   logger.log l, m
        #   if l is ("yourshot_photo_id")
        #   hearts = $("#" + m + " i")
        #   $("a").find(hearts).toggleClass "chosen"

  # Stream Module Init
  stream = new StreamView()
