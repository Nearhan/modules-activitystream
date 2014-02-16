# Unit Tests
describe "App.Views", ->
    it "Activity view can be called/is available", (done) ->
        @activity = new ActivityView()
        expect(@activity).to.be.ok
        done()

    it "Stream view can be called/is available", (done) ->
        @stream = new StreamView()
        expect(@stream).to.be.ok
        done()

# Feature Tests
#