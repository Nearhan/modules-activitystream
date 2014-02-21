(->
    "use strict"

    ActivityView = undefined
    StreamView = undefined

    before (done) ->
        require [
            "views/activity",
            "views/stream"
        ],(_ActivityView, _StreamView) ->
            ActivityView = clone(_ActivityView)
            StreamView = clone(_StreamView)
            done()

    describe "App.Views Unit Tests", ->
        describe "Activity View", ->
            it "Can create a new instance of a Activity view", (done) ->
                @activity = new ActivityView()
                expect(@activity).to.be.ok
                done()

        describe "Stream View", ->
            it "Can create a new instance of a Stream view", (done) ->
                @stream = new StreamView()
                expect(@stream).to.be.ok
                done()
)()