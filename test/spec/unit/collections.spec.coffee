(->
    "use strict"

    StreamCollection = undefined

    beforeEach (done) ->
        require [
            "collections/stream"
        ],(_StreamCollection) ->
            StreamCollection = clone(_StreamCollection)
            done()

    describe "App.Collections Unit Tests", ->
        it "Stream collection can be called/is available", (done) ->
            @collection = new StreamCollection()
            expect(@collection).to.be.ok
            done()
)()