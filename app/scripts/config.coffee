define [
], () ->
    
    'use strict';

    activityStreamServiceAPI: '//localhost:9365/'
    api:
        yourshot_photo:
            data:
                apikey: '',
                format: 'json'
            xhrFields:
                withCredentials: false
    baseUrl: '/api/v1/'
