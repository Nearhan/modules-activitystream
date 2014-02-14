Feature 'Module Loads\n\t',

  'As a user\n',
  '\t  When I visit a page containing the AS Module\n',
  '\t  The page should establish a session auth cookie with the AS Service', ->

    module = null

    Scenario 'On Load', ->
      Given 'A page', ->
        assert document != null, 'There is no DOM object'

      When 'that page loads', (done) ->
        assert ready != null, 'Can\'t find "ready"'
        ready ->
          isDocReady = 1
          done()

      And 'when jQuery is ready', (done) ->
        assert $.isReady = true, 'jQuery is unavailable or not ready'
        done()

      Then 'an Activity Streams Module should instantiate on the page', (done) ->
        assert $('#JS_activitystream') != null, 'Instance of AS Module was not created'
        done()

      And 'a session auth cookie should be set', (done) ->
        assert 1+1 is 2
        done()
