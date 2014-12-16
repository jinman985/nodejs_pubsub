// Generated by CoffeeScript 1.8.0
(function() {
  'use strict';
  var app, badges, express;

  badges = require('./controllers/badges');

  express = require('express');

  app = express();

  app.use(express.json());

  app.post('/', badges.send, badges.save, function(req, res) {
    return console.log('Finished processing request...');
  });

  app.get('/badges', badges.get);

  app.listen(1337, function() {
    return console.log('Listening...');
  });

}).call(this);