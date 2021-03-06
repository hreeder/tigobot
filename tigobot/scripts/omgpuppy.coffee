# Description:
#   Instant cuteness overload.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot puppy me - Receive a puppy
#   hubot [breed] puppy

module.exports = (robot) ->

  robot.respond /puppy me/i, (msg) ->
    msg.http("http://www.thepuppyapi.com/puppy")
      .get() (err, res, body) ->
        msg.send JSON.parse(body).puppy_url

  robot.respond /(.+) puppy/i, (msg) ->
    breed = msg.match[1]
    msg.http("http://www.thepuppyapi.com/puppy?breed=" + breed)
        .get() (err, res, body) ->
            puppy_url = JSON.parse(body).puppy_url
            if puppy_url == ""
              msg.send "Can't find any puppies :("
            else
              msg.send JSON.parse(body).puppy_url
