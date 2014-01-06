define [
  'backbone'
  'jquery'
  'underscore'
  'sailsio'
  'config'
  'modules/logger'
  'modules/activity'
  'views/stream'
  'modules/user',
], (Backbone, $, _, io, config, Logger, Activity, StreamView, User) ->
  'use strict';

  class ActivityStreamModule

    ready: (options) ->
      @user = new User(options.user)
      init(@user)
      window.x = @

    init= (user) ->
      # Base Init that loads our other modules
      logger = new Logger()

      # Will have to figure out how to get a AS cookie before we fire everything else
      # Stream Module Init
      stream = new StreamView()

      activity = new Activity(stream)


      # Init Socket Connection
      socket = io.connect(config.activityStreamServiceAPI)

      socket.on "connect", socketConnected = ->
        stream.ready()
        socket.get user.getAll('FAVORITED'), (data) ->
          _.each data, stream.addActivity

        socket.post '/api/v1/subscribe', { user: user.id }

        socket.on "message", messageReceived = (message) ->
          activity.parseMessage(message.data.data, message.verb)
