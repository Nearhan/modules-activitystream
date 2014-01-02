define [
  'underscore'
  'backbone'
], (_, Backbone) ->
  'use strict';

  class ComponentModel extends Backbone.Model

  	defaults: 
  		apiKey: 'test'

  	initialize: ->
  		@url = '/component/'

  	fetch: ->
        api = 'http://mc.dev.nationalgeographic.com:8000/user/1/' # value.get('data')[type + '_api']
        $.ajax(
          url: api
          type: "GET"
          dataType: "json"
          xhrFields:
            withCredentials: true
        ).done (results) ->
          set results