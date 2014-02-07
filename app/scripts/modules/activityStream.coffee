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

      # Stream Module Init
      stream = new StreamView()

      activity = new Activity(stream)

      # Establish/reinit a session cookie with the Activity Streams server
      $.ajax
        url: config.activityStreamServiceAPI
        dataType: "jsonp"
        complete: ->
          # Init Socket Connection
          socket = io.connect(config.activityStreamServiceAPI)

          socket.on "connect", socketConnected = ->
            stream.ready()
            socket.get user.getAll('FAVORITED'), (data) ->
              _.each data, stream.addActivity

            # Important for this to happen after the GET request
            # because we want updates to happen after initial load
            socket.post '/api/v1/subscribe', { user: user.id }

            socket.on "message", messageReceived = (message) ->
              activity.parseMessage(message.data.data, message.verb)
