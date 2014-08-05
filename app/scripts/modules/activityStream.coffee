define [
    'backbone'
    'jquery'
    'underscore'
    'sailsio'
    'modules/config'
    'modules/logger'
    'modules/activity'
    'views/stream'
    'modules/user',
], (Backbone, $, _, io, config, Logger, Activity, StreamView, User) ->

    'use strict'

    class ActivityStreamModule

        constructor: ->
            @logger = new Logger() # Base Init that loads our other modules
            @stream = new StreamView() # Stream Module Init
            @activity = new Activity(@stream) # Activity Module Init

        ready: (options) ->
            @user = new User(options.user)
            @init()

        init: () ->
            @setAuth config.activityStreamServiceAPI + 'api/v1', @user


        setAuth: (url, user) ->
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
            # JSONP has some security issues that we don't want to expose on the
            # Service side.  See http://stackoverflow.com/questions/613962/is-jsonp-safe-to-use

            $.ajax
                url: url
                dataType: 'jsonp'
                timeout: 12000
                cache: false
                success: (data) =>
                    @createSocket @user
                error: (xhr, textStatus) =>
                    @stream.error("Error: " + textStatus )

        createSocket: () ->
            @socket = io.connect(config.activityStreamServiceAPI)
            @socket.on 'connect', =>
                @socketStart()

        socketStart: () =>
            @stream.ready()
            @socket.get @user.getAll(), (data) =>
                if data.status == 404 then throw new Error(data.status)
                _.each data, (o) =>
                    if o.items then _.each o.items, @stream.addActivity
                    else console.log 'User has no items'
            @socket.get @user.getFollowing(), (data) =>
                if data.status == 404 then throw new Error(data.status)
                _.each data, (o) =>
                    if o.items then _.each o.items, @stream.addActivity
                    else console.log 'User\'s followed, have no items'

            # Important for this to happen after the GET request
            # because we want updates to happen after initial load
            @socket.post '/api/v1/subscribe', { user: @user.id }

            @socket.on 'message', messageReceived = (message) =>
                @activity.parseMessage(message.data.data, message.verb)
