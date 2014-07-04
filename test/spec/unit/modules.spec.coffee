define([
    "modules/activity",
    "modules/activityStream",
    "modules/logger",
    "modules/user"
    ],(_Activity, _ActivityStreamModule, _Logger, _User) ->

    Activity = undefined
    ActivityStreamModule = undefined
    Logger = undefined
    User = undefined

    before (done) ->
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

            it "Can create a message", (done) ->
                @activity = new Activity()
                @activity.parseMessage({id: '1', verb: 'create', data: {data: {}}}, 'create')
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
)