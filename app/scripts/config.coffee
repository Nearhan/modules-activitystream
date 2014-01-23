define [
], () ->
  'use strict';

  activityStreamServiceAPI: 'http://as.nationalgeographic.com:9365/'
  api:
    yourshot_photo:
        data:
            apikey: '',
            format: 'json'
        xhrFields:
            withCredentials: false
  baseUrl: '/api/v1/'
