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
  'modules/user'
], (Backbone, $, _, io, config, Logger, Activity, StreamView, User) ->
  Backbone.history.start()

  class ActivityStreamMoudule

    ready: (options) ->
      user = validate options
      if not user
        return throw new Error('Incorrect User Object')
      init(user)

    validate = (options) =>  
      if 'User' of options
        user = options.User
        if 'user_type' of user and 'user_id' of user
          return new User(user)
        return null
      return null

    init = (user) ->

      # Base Init that loads our other modules
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
        socket.get user.getAll('FAVORITED'), (data) ->
          _.each data, stream.addActivity

        socket.post '/api/v1/subscribe', { user: user.user_id }

        socket.on "message", messageReceived = (message) ->
          activity.parseMessage(message.data.data, message.verb)

  window.AS = new ActivityStreamMoudule()

  testUserObj =
    User:
      user_type: 'mmdb_user'
      user_id: '1'

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



