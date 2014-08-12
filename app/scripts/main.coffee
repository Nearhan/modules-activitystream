define 'ActivityStream', [
    'backbone'
    'modules/activityStream'
    'modules/helpers'
    'modules/storage'
], (Backbone, ActivityStreamModule, helpers, storage) ->
    Backbone.history.start()

    if typeof _TEST_MODE is "undefined" # not sure what this is
        # Not in test mode, initiate the module
        AS = new ActivityStreamModule()
        return AS

        # settings that an implementing site
        # would use to instantiate the module

require ['ActivityStream'], (AS)->
        # Different socket events will probably have to be handled
        # in a module that gets instantiated here
        # socket.on "message", messageReceived = (message) ->
            # logger.log "New comet message received :: ", message
            # $.each message.data.object.data, (l, m) ->
            #   logger.log l, m
            #   if l is ("yourshot_photo_id")
            #   hearts = $("#" + m + " i")
            #   $("a").find(hearts).toggleClass "chosen"

