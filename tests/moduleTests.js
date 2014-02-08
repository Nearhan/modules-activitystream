var request = require('request'),
    url = require('url'),
    assert = require('assert'),
    baseUrl = 'http://as.dev.nationalgeographic.com:9365/api',
    apiVersion = '1';

beforeEach(function() {
    baseUrl = {
        protocol: 'http',
        hostname: 'as.dev.nationalgeographic.com',
        port: 9365,
        pathname: 'api/v1/'
    };
});

describe('Activity Streams Module Base Tests', function() {
    describe('Check Basic Get Requests', function () {
        it('Check response for setting auth cookie endpoint', function(done) {
           var apiUrl = url.format(baseUrl);
            request(apiUrl, function (err, response, body) {
                assert.equal(response.statusCode, 200);
                done();
            });
        });
    });
});
