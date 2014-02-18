(->
    "use strict"

    Activity = undefined
    ActivityStreamModule = undefined
    Logger = undefined
    User = undefined

    beforeEach (done) ->
        require [
            "modules/activity",
            "modules/activityStream",
            "modules/logger",
            "modules/user"
        ],(_Activity, _ActivityStreamModule, _Logger, _User) ->
            Activity = clone(_Activity)
            ActivityStreamModule = clone(_ActivityStreamModule)
            Logger = clone(_Logger)
            User = clone(_User)
            done()

    describe "App.Modules Unit Tests", ->
        it "Activity module can be called/is available", (done) ->
            @activity = new Activity()
            expect(@activity).to.be.ok
            done()

        it "ActivityStreamModule module can be called/is available", (done) ->
            @activityStream = new ActivityStreamModule()
            expect(@activityStream).to.be.ok
            done()

        it "Logger module can be called/is available", (done) ->
            @logger = new Logger()
            expect(@logger).to.be.ok
            done()

        # Commenting out User Module test for now
        # it "User module can be called/is available", (done) ->
        #     @user = new User()
        #     expect(@user).to.be.ok
        #     done()
)()