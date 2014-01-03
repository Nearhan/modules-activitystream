define [
	'models/activity',
], (ActivityModel) ->
  'use strict';

  class Activity
  	constructor: (@stream) ->

  	parseMessage: (message, verb) ->
  		switch verb
  			when 'create' then @create(message)
  			when 'delete' then @remove(message)
  			when 'update' then @update(message)

  	create: (message) ->
  		activity = new ActivityModel(message)
  		@stream.addActivity(activity)
  		console.log activity

  	remove: (message) ->
  		console.log 'Not implemented :P'

  	update: (message) ->
  		console.log 'Not implemented :P'