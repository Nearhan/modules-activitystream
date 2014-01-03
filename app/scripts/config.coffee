define [
], () ->
  'use strict';

  activityStreamServiceAPI: 'http://as.nationalgeographic.com:9365/'
  api:
    yourshot_photo:
        data:
            apikey: '3acd2b1a326570cc800d4de69a7162e1f26e4d79',
            format: 'json'
        xhrFields:
            withCredentials: false
  baseUrl: '/api/v1/'
