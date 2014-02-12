var should = require('should'),
    request = require('request'),
    async = require('async'),
    sinon = require('sinon'),
    baseUrl = 'http://as.dev.nationalgeographic.com:9365/api/v1';

function setCookie(cb) {
    async.waterfall([
        function(callback) {
            request.get(baseUrl, function(err, response, body) {
                if (err) return callback(err);
                callback(null, body);
            });
        }
    ], cb);
}

describe('Activity Streams Module Endpoint Tests', function() {
    before(function(done) {
        sinon
            .stub(request, 'get')
            .yields(null, null, JSON.stringify({}));
        done();
    });

    after(function(done) {
        request.get.restore();
        done();
    });

    it('can set session auth cookie', function(done) {
        setCookie(function(err, result) {
            if (err) return done(err);
            request.get.called.should.be.equal(true);
            result.should.not.be.empty;
            done();
        });
    });
});