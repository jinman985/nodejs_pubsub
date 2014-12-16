'use strict'

_ = require 'underscore'
model = require '../models/badges'

# Sends badges to the model
exports.save = (req, res, next) ->
  badges = _.clone req.body
  model.save badges, (err) ->
    if err
      return res.json 503, { error: true }
  next()
  model.trim()

# Sends badges to the pubsub socket
exports.send = (req, res, next) ->
  badges = _.clone req.body
  model.send badges, (err)->
    if err
      return res.json 503, { error: true }
    res.json 200, { error: null }
  next()

exports.get = (req, res, next) ->
  model.get (err, data)->
    if err
      return res.json 503, { error: true }
    res.json 200, data
