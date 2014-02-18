(->
    "use strict"

    ActivityModel = undefined
    ActorModel = undefined
    ComponentModel = undefined
    ObjectModel = undefined
    UserModel = undefined
    VerbModel = undefined

    beforeEach (done) ->
        require [
            "models/activity",
            "models/actor",
            "models/component",
            "models/object",
            "models/user",
            "models/verb"
        ],(_ActivityModel, _ActorModel, _ComponentModel,
            _ObjectModel, _UserModel, _VerbModel) ->
            ActivityModel = clone(_ActivityModel)
            ActorModel = clone(_ActorModel)
            ComponentModel = clone(_ComponentModel)
            ObjectModel = clone(_ObjectModel)
            UserModel = clone(_UserModel)
            VerbModel = clone(_VerbModel)
            done()

    # Unit tests
    # *** These are commented out because they do not work as-is yet ***

    #describe "App.Models", ->
        # it "Activity model can be called/is available", (done) ->
        #     @activity = new ActivityModel()
        #     expect(@activity).to.be.ok
        #     done()

        # it "Actor model can be called/is available", (done) ->
        #     @actor = new ActorModel()
        #     expect(@actor).to.be.ok
        #     done()

        # it "Component model can be called/is available", (done) ->
        #     @component = new ComponentModel()
        #     expect(@component).to.be.ok
        #     done()

        # it "Object model can be called/is available", (done) ->
        #     @object = new ObjectModel()
        #     expect(@object).to.be.ok
        #     done()

        # it "User model can be called/is available", (done) ->
        #     @user = new UserModel()
        #     expect(@user).to.be.ok
        #     done()

        # it "Verb model can be called/is available", (done) ->
        #     @verb = new VerbModel()
        #     expect(@verb).to.be.ok
        #     done()


    # Feature tests
    #
)()