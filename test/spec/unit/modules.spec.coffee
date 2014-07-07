define([
    "modules/activity",
    "modules/activityStream",
    "modules/logger",
    "modules/user"
    "views/stream"
    'models/activity',
    ],(_Activity, _ActivityStreamModule, _Logger, _User, _StreamView, ActivityModel) ->


    Activity = clone(_Activity)
    ActivityStreamModule = clone(_ActivityStreamModule)
    Logger = clone(_Logger)
    User = clone(_User)
    StreamView = clone(_StreamView)

    describe "App.Modules Unit Tests", ->
        describe "Activity Module", ->
            it "Can create a new instance of an Activity module", (done) ->
                @view = new StreamView()
                @activity = new Activity(@view)
                expect(@activity).to.be.ok
                done()

            it "Can create a message", (done) ->
                @view = new StreamView()
                @activity = new Activity(@view)
                arg =
                        actor:
                            data: {type: 'actor'}
                        verb:
                            data: {type: 'verb'}
                        object:
                            data: {type: 'object'}

                @activity.parseMessage({id: '1', verb: 'create', data: {data: arg} }, 'create')
                done()


            it "Can remove a message", (done) ->
                @view = new StreamView()
                @activity = new Activity(@view)
                arg =
                    actor:
                        data: {type: 'actor'}
                    verb:
                        data: {type: 'verb'}
                    object:
                        data: {type: 'object'}

                @activity.parseMessage({id: '1', verb: 'destroy', data: {data: arg} }, 'destroy')
                done()



            it "Can remove a message", (done) ->
                @view = new StreamView()
                @activity = new Activity(@view)
                arg =
                    actor:
                        data: {type: 'actor'}
                    verb:
                        data: {type: 'verb'}
                    object:
                        data: {type: 'object'}

                @activity.parseMessage({id: '1', verb: 'update', data: {data: arg} }, 'update')
                done()


        describe "ActivityStreamModule Module", ->
            it "Can create a new instance of an ActivityStreamModule module", (done) ->
                @activityStream = new ActivityStreamModule()
                @activityStream.init()
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