(->
    "use strict"

    StreamCollection = undefined

    before (done) ->
        require [
            "collections/stream"
        ],(_StreamCollection) ->
            StreamCollection = clone(_StreamCollection)
            done()

    describe "App.Collections Unit Tests", ->
        it "Can create a new instance of a Stream collection", (done) ->
            @collection = new StreamCollection()
            expect(@collection).to.be.ok
            done()
)()