# Unit Tests
describe "App.Modules", ->
    it "ActivityStreamModule module can be called/is available", (done) ->
        @activityStream = new ActivityStreamModule()
        expect(@activityStream).to.be.ok
        done()

# Feature Tests
#