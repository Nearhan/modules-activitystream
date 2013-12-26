define [
  'jquery'
  'underscore'
  'backbone'
  'templates'
], ($, _, Backbone, JST) ->
  class ActivitiesView extends Backbone.View
    template: JST['app/scripts/templates/activities.hbs']