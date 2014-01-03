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
  'underscore'
  'sailsio'
  'config'
  'modules/logger'
  'modules/activity'
  'views/stream'
  'models/activity'
  'views/activity'
  'collections/stream'
], (Backbone, $, _, io, config, Logger, Activity, StreamView) ->
  Backbone.history.start()

  # Base Init
  logger = new Logger()

  # Will have to figure out how to get a AS cookie before we fire everything else

  # Stream Module Init
  window.stream = new StreamView()

  activity = new Activity(stream)

  # Init Socket Connection
  socket = io.connect(config.activityStreamServiceAPI)

  socket.on "connect", socketConnected = ->
    console.log "Socket opened"
    stream.ready()
    socket.get '/api/v1/mmdb_user/1/FAVORITED', (data) ->
        _.each data, stream.addActivity

    socket.post '/api/v1/subscribe', { user: 1 }

    socket.on "message", messageReceived = (message) ->
      activity.parseMessage(message, message.verb)

  # Different socket events will probably have to be handled
  # in a module that gets instantiated here
  # socket.on "message", messageReceived = (message) ->
        # logger.log "New comet message received :: ", message
        # $.each message.data.object.data, (l, m) ->
        #   logger.log l, m
        #   if l is ("yourshot_photo_id")
        #   hearts = $("#" + m + " i")
        #   $("a").find(hearts).toggleClass "chosen"



