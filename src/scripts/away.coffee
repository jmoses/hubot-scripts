# Tell Hubot that you're not around.
#
# [out|away] <message>
module.exports = (robot) ->
  robot.hear /./i, (msg) ->
    data = robot.brain.data.away ?= {}
    if data[msg.message.user.name]
      msg.send "Welcome back, " + msg.message.user.name
      delete data[msg.message.user.name]

  robot.respond /(away|out)\s+(.*)/i, (msg) ->
    data = robot.brain.data.away ?= {}

    data[msg.message.user.name] = msg.match[2]
    msg.send "Bye, " + msg.message.user.name

  robot.respond /where is (.*)/i, (msg) ->
    users = robot.usersForFuzzyName(msg.match[1])
    data = robot.brain.data.away ?= {}
    if users.length is 1
      user = users[0]
      if data[user.name]
        msg.send user.name + " is out: " + data[user.name]
      else
        msg.send "I have no idea where " + user.name + " is."
    else if users.length > 1
      msg.send "Too many users like that"
    else
      msg.send "#{msg.match[1]}? Never heard of 'em"

