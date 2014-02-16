define [
], () ->
    root = exports ? this

    'use strict';

    class root.Logger
        log: ->
            console.log.apply console, arguments  if typeof console isnt "undefined"