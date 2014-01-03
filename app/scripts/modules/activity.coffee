define [
	'models/activity',
], (ActivityModel) ->
  'use strict';

  class Activity
  	constructor: (@stream) ->

  	parseMessage: (message, verb) ->
  		switch verb
  			when 'create' then @create(message)
  			when 'destroy' then @remove(message)
  			when 'update' then @update(message)

  	create: (message) ->
  		activity = new ActivityModel(message.data.data)
  		@stream.addActivity(activity)
  		console.log activity

  	remove: (message) ->
  		console.log message.verb + message.id

  	update: (message) ->
  		console.log message