define [
    'underscore'
    'backbone'
    'models/component'
], (_, Backbone, ComponentModel) ->

    'use strict';

    class ActorModel extends ComponentModel
        url: '#'