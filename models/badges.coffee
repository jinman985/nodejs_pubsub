'use strict'

redis = require '../lib/redis'
broadcast = require '../lib/broadcast'

# Save badges to database
# @param {Array} badges
# @param {Function} callback
exports.save = (badges, callback) ->
  if !badges.length
    return callback null, null
  badge = badges.pop()
  redis.lpush 'badges', JSON.stringify(badge), (err)->
    if err
      return callback err, null
    exports.save badges, callback

exports.trim = ->
  redis.ltrim('badges', 0, 9)

exports.send = (badges, callback)->
  badges.forEach(broadcast.send)
  callback null, null

exports.get = (callback)->
  redis.lrange 'badges', 0, -1, (err, data)->
    if err
      return callback err, null
    callback null, data.map(JSON.parse)
