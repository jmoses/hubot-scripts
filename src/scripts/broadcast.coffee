_ = require('underscore')

broadcastToAllRooms = (message) ->
  _.each(@.adapter.bot.rooms, (room) =>
    @.adapter.bot.Room(room).speak(message, -> )
  )

module.exports = (robot) ->
  robot.broadcast = broadcastToAllRooms

  robot.respond /broadcast (.*)/, (msg) ->
    robot.broadcast(msg.match[1])
