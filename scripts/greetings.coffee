# Description:
#   Teaches choebot how to welcome new users when they sign in

module.exports = (robot) ->
  robot.enter (res) ->
    res.send res
   
