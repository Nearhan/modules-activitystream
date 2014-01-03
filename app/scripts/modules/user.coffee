define [
], () ->
  'use strict';

  class User

    constructor: (dataObj) ->
        @user_type = dataObj['user_type']
        @user_id = dataObj['user_id']


    baseUrl = '/api/v1/'

    getAll: (verb_type) ->
        baseUrl + "#{@user_type}/#{@user_id}/" + verb_type
