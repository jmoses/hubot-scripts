# Module to auto-build jenkins projects on github pushes

_ = require('underscore')
_.string = require('underscore.string')
_.mixin(_.string.exports())

module.exports = (robot) ->
  robot.hear /\[(.*)\/(.*)\]/i, (msg) ->
    repo = msg.match[1]
    branch =  msg.match[2]

    if ! _.include(['master', 'production', 'production_next'], branch)
      return
    
    project = "#{_.capitalize(repo)}-#{_.camelize(branch)}"

    msg.match = [null, project]

    robot.jenkins.build( msg )
    
