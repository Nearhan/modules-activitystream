define [
  'underscore'
  'backbone'
], (_, Backbone) ->
  'use strict';

  class ComponentModel extends Backbone.Model
  	defaults: 
  		apiKey: 'test'