define [
], () ->
  'use strict';

  activityStreamServiceAPI: '//as.dev.nationalgeographic.com:9365/'
  api:
    yourshot_photo:
        data:
            apikey: '',
            format: 'json'
        xhrFields:
            withCredentials: false
  baseUrl: '/api/v1/'
