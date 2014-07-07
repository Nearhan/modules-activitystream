require [
    "views/activity",
    "views/stream"
    "models/activity"
],(_ActivityView, _StreamView, _ActivityModel) ->
    "use strict"

    ActivityView = clone(_ActivityView)
    StreamView = clone(_StreamView)
    ActivityModel = clone(_ActivityModel)

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

            it "Add a new activity model", (done) ->
                arg =
                    actor:
                        data: {type: 'actor'}
                    verb:
                        data: {type: 'verb'}
                    object:
                        data: {type: 'object'}

                @stream = new StreamView()
                dfd = @stream.addActivity arg

                expect(dfd).to.be.an('object')
                done()