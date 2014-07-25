require [
    'handlebars'
], (Handlebars) ->

    'use strict';

    Handlebars.registerHelper 'toLower', (value) ->
        value.toLowerCase()

    Handlebars.registerHelper 'formatDate', (date) ->
        mthNames = [
            "Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"
        ]

        newDate = new Date(date)
        month = mthNames[newDate.getMonth()]
        day = newDate.getDate()
        compiledDate = day + ' ' + month

    Handlebars.registerHelper 'ifCond', (v1, v2, options) ->
        if(v1 == v2)
            return options.fn(this);
        options.inverse(this);
