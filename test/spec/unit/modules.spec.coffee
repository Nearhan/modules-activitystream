(->
    "use strict"

    Activity = undefined
    ActivityStreamModule = undefined
    Logger = undefined
    User = undefined

    before (done) ->
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
        describe "Activity Module", ->
            it "Can create a new instance of an Activity module", (done) ->
                @activity = new Activity()
                expect(@activity).to.be.ok
                done()

        describe "ActivityStreamModule Module", ->
            it "Can create a new instance of an ActivityStreamModule module", (done) ->
                @activityStream = new ActivityStreamModule()
                expect(@activityStream).to.be.ok
                expect(@activityStream).to.be.an("object")
                done()

        describe "Logger Module", ->
            it "Can create a new instance of a Logger module", (done) ->
                @logger = new Logger()
                expect(@logger).to.be.ok
                done()

        describe "User Module", ->
            it "Can create a new instance of a User module", (done) ->
                @user = new User('mmdb_user', '1')
                expect(@user).to.be.ok
                done()
)()