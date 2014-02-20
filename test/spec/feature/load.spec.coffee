(->
    "use strict"
    ActivityStreamModule = undefined
    jQuery = undefined
    server = undefined

    before (done) ->
        require [
            "modules/activityStream"
        ],(_ActivityStreamModule) ->
            ActivityStreamModule = clone(_ActivityStreamModule)
            jQuery = $
            server = sinon.fakeServer.create()
            done()
    
    after () ->
        server.restore()

    Feature 'AS Module Loads\n\t',
        'As a user\n',
        '\t  When I visit a page containing the Activity Streams Module\n',
        '\t  The AS Module should render on the page', ->

            Scenario 'On Load', ->
                Given 'A page', ->
                    assert document != null, 'There is no DOM object'

                When 'that page loads', (done) ->
                    assert ready != null, 'Can\'t find "ready"'
                    ready ->
                        done()

                And 'when jQuery is ready', (done) ->
                    assert jQuery.isReady = true, 'jQuery is unavailable or not ready'
                    done()

                Then 'a new instance of the AS module object should exist when created', (done) ->
                    @AS = new ActivityStreamModule()
                    expect(@AS).to.be.ok
                    expect(@AS).to.be.an("object")
                    done()

                Then 'the AS module object should contact the service when ready is fired to set auth cookie', (done) ->
                    expect(@AS.setAuth).to.be.ok
                    @AS.setAuth '/api/v1', testUserObj
                    # Sinon fake server can not process JSONP calls (http://sinonjs.org/docs/#json-p)
                    # Attempting to stub jQuery will result in an error because ajax is already wrapped.
                    # So here we are testing to see that the URL is at least attempted via JSONP, which
                    # adds the ?callback=jQuery.... to the URL in the setAuth method.  If it is, then 
                    # assume the server response was ok
                    expect(server.requests[0].url).to.match(/^\/api\/v1\?callback\=jQuery/)
                    done()

                Then 'the AS Module should instantiate on the page', (done) ->
                    assert jQuery('#JS_activitystream') != null, 'Instance of AS Module was not created'
                    done()
)()