# Unit tests
describe "App.Collections", ->
    it "Stream collection can be called/is available", (done) ->
        @collection = new StreamCollection()
        expect(@collection).to.be.ok
        done()

# Feature tests
#