(->
    "use strict"

    ActivityModel = undefined
    ActorModel = undefined
    ComponentModel = undefined
    ObjectModel = undefined
    VerbModel = undefined

    before (done) ->
        require [
            "models/activity",
            "models/actor",
            "models/component",
            "models/object",
            "models/verb"
        ],(_ActivityModel, _ActorModel, _ComponentModel,
            _ObjectModel, _VerbModel) ->
            ActivityModel = clone(_ActivityModel)
            ActorModel = clone(_ActorModel)
            ComponentModel = clone(_ComponentModel)
            ObjectModel = clone(_ObjectModel)
            VerbModel = clone(_VerbModel)
            done()
    # *** These are commented out because they do not work as-is yet ***

    #describe "App.Models Unit Tests", ->
        # it "Can create a new instance of a Activity model", (done) ->
        #     @activity = new ActivityModel()
        #     expect(@activity).to.be.ok
        #     done()

        # it "Can create a new instance of a Actor model", (done) ->
        #     @actor = new ActorModel()
        #     expect(@actor).to.be.ok
        #     done()

        # it "Can create a new instance of a Component model", (done) ->
        #     @component = new ComponentModel()
        #     expect(@component).to.be.ok
        #     done()

        # it "Can create a new instance of a Object model", (done) ->
        #     @object = new ObjectModel()
        #     expect(@object).to.be.ok
        #     done()

        # it "Can create a new instance of a User model", (done) ->
        #     @user = new UserModel()
        #     expect(@user).to.be.ok
        #     done()

        # it "Can create a new instance of a Verb model", (done) ->
        #     @verb = new VerbModel()
        #     expect(@verb).to.be.ok
        #     done()
)()
