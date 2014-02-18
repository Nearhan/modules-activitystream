'use strict';

# Global function to assess if the DOM is ready
@ready ?= (fn, context) ->
    fire = ->
        window.ready.fired = true unless window.ready.fired
        fn.apply context

    return fire() if document.readyState is "complete"

# Global function to clone/deep copy required components used in 
# tests.  Sneaks them into a global so that no test can permanently
# mutate or interefere with them.
#
# @param Object obj   // any object
# @return Object      // object--cloned
@clone = (obj) ->
    return obj  if obj is null or typeof (obj) isnt "object"
    temp = new Object()
    for key of obj
        temp[key] = clone(obj[key])
    temp
