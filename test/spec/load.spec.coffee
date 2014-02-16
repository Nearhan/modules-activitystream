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
                    #console.log config.activityStreamServiceAPI
                    done()

            And 'when jQuery is ready', (done) ->
                assert $.isReady = true, 'jQuery is unavailable or not ready'
                done()

            Then 'the AS module object should exist', (done) ->
                expect(window.AS).to.be.an("object");
                done()

            Then 'the AS Module should instantiate on the page', (done) ->
                assert $('#JS_activitystream') != null, 'Instance of AS Module was not created'
                done()
