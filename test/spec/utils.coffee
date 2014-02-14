'use strict';

root = this

# DOM ready
root.ready ?= (fn, context) ->
  fire = ->
    window.ready.fired = true unless window.ready.fired
    fn.apply context

  return fire() if document.readyState is "complete"
