(->
    "use strict"

    ActivityView = undefined
    StreamView = undefined

    beforeEach (done) ->
        require [
            "views/activity",
            "views/stream"
        ],(_ActivityView, _StreamView) ->
            ActivityView = clone(_ActivityView)
            StreamView = clone(_StreamView)
            done()

    describe "App.Views Unit Tests", ->
        it "Activity view can be called/is available", (done) ->
            @activity = new ActivityView()
            expect(@activity).to.be.ok
            done()

        it "Stream view can be called/is available", (done) ->
            @stream = new StreamView()
            expect(@stream).to.be.ok
            done()
)()