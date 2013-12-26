define [
  'underscore'
  'backbone'
], (_, Backbone) ->
  'use strict';

  class ActorModel extends Backbone.Model
    defaults:
        type: 'someapp_somemodel'
        id: '0'
        origin: 'someapp_api_link'
