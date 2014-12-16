'use strict'

axon = require 'axon'
socket = axon.socket 'pub'

socket.bind 1338

exports.send = (badge) ->
  socket.send badge
