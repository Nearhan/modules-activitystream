define [
  'jquery'
  'underscore'
  'backbone'
  'templates'
], ($, _, Backbone, JST) ->
  class ActivityView extends Backbone.View
    template: JST['app/scripts/templates/activity.hbs']