# Description:
#   Hubotで定期的に発言する.
#
# Commands:
#   hubot start job - start cron
#   hubot stop  job - stop cron
CronJob = require("cron").CronJob

module.exports = (robot) ->
  taskA = ->
    robot.send {room: "bottest"}, "特定のチャネルへ投稿してみたよ！"
  # ..

job = new CronJob(
  cronTime: "10 * * * * *"
  onTick: ->
    taskA()
    return
  start: false
)

module.exports = (robot) ->

  robot.respond /start job/i, (msg) ->
    msg.send "Start job.."
    job.start()

  robot.respond /stop job/i, (msg) ->
    msg.send "Stop job.."
    job.stop()
