'use strict'

redis = require 'redis'
client = redis.createClient()

client.on 'error', (err)->
  throw err

module.exports = client
