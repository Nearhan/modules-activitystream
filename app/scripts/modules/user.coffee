define [
    'underscore'
    'config'
], (_, config) ->
  'use strict';

  class User

    constructor: (args) ->
        @type = args.type
        @id = args.id

    getAll: (verbType) ->
        config.baseUrl + "#{@type}/#{@id}/" + verbType
