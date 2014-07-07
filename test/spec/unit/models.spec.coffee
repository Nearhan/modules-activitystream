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

            describe "App.Models Unit Tests", ->
                 it "Can create a new instance of a Actor model", (done) ->
                     data =
                         data: {type: 'actor'}
                     @actor = new _ActorModel(data)
                     expect(@actor).to.be.ok
                     done()

                 it "Can create a new instance of a Component model", (done) ->
                     data =
                         data: {type: 'component'}

                     @component = new ComponentModel(data)
                     expect(@component).to.be.ok
                     done()

                 it "Can create a new instance of a Object model", (done) ->
                     data =
                         data: {type: 'object'}
                     @object = new ObjectModel(data)
                     expect(@object).to.be.ok
                     done()

                 it "Can create a new instance of a User model", (done) ->
                     @user = new UserModel()
                     expect(@user).to.be.ok
                     done()

                 it "Can create a new instance of a Verb model", (done) ->
                     data =
                         data: {type: 'verb'}
                     @verb = new VerbModel(data)
                     expect(@verb).to.be.ok
                     done()

                 it "Can create a new instance of a Activity model", (done) ->

                     arg =
                         actor:
                             data: {type: 'actor'}
                         verb:
                             data: {type: 'verb'}
                         object:
                             data: {type: 'object'}

                     @activity = new ActivityModel(arg)
                     expect(@activity).to.be.ok

                     json = @activity.toJSON()
                     expect(json).to.be.an('object')
                     expect(json).to.have.property('actor')
                     expect(json).to.have.property('object')
                     expect(json).to.have.property('verb')
                     done()
