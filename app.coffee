'use strict'

badges = require './controllers/badges'
express = require 'express'
app = express()

app.use express.json()

app.post '/', badges.send, badges.save, (req, res) ->
  console.log 'Finished processing request...'

app.get '/badges', badges.get

app.listen 1337, ->
  console.log 'Listening...'
