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

      # Activity Module Init
      activity = new Activity(stream)

      socket = {}

      # Establish/reinit a session cookie with the Activity Streams server
      # Without sending an empty JSONP call to the AS server, we won't get
      # an authentication cookie that will allow us to establish the socket.
      # Needs to be JSONP as this is technically considered a 3rd party domain.
      # If a cookie already exists, and the sesion is valid, then the same cookie
      # will be used.
      #
      # The AS Service will respond with a JSON response (res.json()), so we just
      # check to make sure that the call completed and that the status code is not 0.
      # Otherwise, the calls on the Service end would need to be converted to res.jsonp().
      # JSONP apparently has some security issues that we don't want to expose on the 
      # Service side.
      
      $.ajax
        url: config.activityStreamServiceAPI + 'api/v1'
        dataType: 'jsonp'
        timeout: 12000
        cache: false
        complete: (data) ->
          # Init Socket Connection
          if data.status isnt 0
            socket = io.connect(config.activityStreamServiceAPI)
            socket.on 'connect', socketStart
        error: (xhr, textStatus) ->
          stream.error("Error: " + textStatus )

      socketStart= ->
        stream.ready()
        socket.get user.getAll(), (data) ->
          _.each data, stream.addActivity

        # Important for this to happen after the GET request
        # because we want updates to happen after initial load
        socket.post '/api/v1/subscribe', { user: user.id }

        socket.on 'message', messageReceived = (message) ->
          activity.parseMessage(message.data.data, message.verb)
