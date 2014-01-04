define [
    'config'
], (config) ->
  'use strict';

  class User

    constructor: (dataObj) ->
        @user_type = dataObj['user_type']
        @user_id = dataObj['user_id']


    getAll: (verb_type) ->
        config.baseUrl + "#{@user_type}/#{@user_id}/" + verb_type
