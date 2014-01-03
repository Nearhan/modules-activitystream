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
  'modules/activityStream'
], (Backbone, $, _, io, config, Logger, Activity, StreamView, User, ActivityStreamMoudule) ->
  'use strict';

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
