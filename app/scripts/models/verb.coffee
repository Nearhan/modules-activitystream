define [
    'underscore'
    'backbone'
    'models/component'
], (_, Backbone, ComponentModel) ->
    root = exports ? this

    'use strict';

    class root.VerbModel extends ComponentModel
