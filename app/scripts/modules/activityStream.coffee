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

    console.log('test', config);
    class ActivityStreamModule
        socket = undefined
        stream = undefined

        ready: (options) ->
            @user = new User(options.user)
            this.init(@user)
            window.x = @

        init: (user) ->
            # Base Init that loads our other modules
            logger = new Logger()

            # Stream Module Init
            stream = new StreamView()

            # Activity Module Init
            activity = new Activity(stream)

            socket = {}  

            this.setAuth config.activityStreamServiceAPI + 'api/v1', user
            

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
            createSocket = this.createSocket
            
            $.ajax
                url: url
                dataType: 'jsonp'
                timeout: 12000
                cache: false
                success: (data) ->
                    createSocket user
                error: (xhr, textStatus) ->
                    stream.error("Error: " + textStatus )

        createSocket: (user) ->
            socket = io.connect(config.activityStreamServiceAPI)
            socket.on 'connect', socketStart user

        socketStart= (user) ->
            stream.ready()
            socket.get user.getAll(), (data) ->
                _.each data, stream.addActivity

            # Important for this to happen after the GET request
            # because we want updates to happen after initial load
            socket.post '/api/v1/subscribe', { user: user.id }

            socket.on 'message', messageReceived = (message) ->
                activity.parseMessage(message.data.data, message.verb)
