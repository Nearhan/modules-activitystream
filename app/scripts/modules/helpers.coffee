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
    compiledDate = month + ' ' + day

  Handlebars.registerHelper 'getBadge', (verb) ->
    switch verb
      when 'FAVORITED' then 'nationalGeographic_web-heart.png'
