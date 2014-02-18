define [
], () ->

    'use strict';

    class Logger
        log: ->
            console.log.apply console, arguments  if typeof console isnt "undefined"