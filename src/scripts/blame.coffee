# blame <thing>
module.exports = (robot) ->
  robot.respond /blame (.*)/i, (msg) ->
    msg.send "It's all #{msg.match[1]}s fault."
