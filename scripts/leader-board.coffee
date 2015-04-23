# Description:
#   Teaches choebot how to scrap the front page of fishcenter
#   and post the leader board
# Commands:
#   choebot who's winning - response with the current leader this week

cheerio = require('cheerio')

module.exports = (robot) ->
  robot.respond /who's winning/, (res) ->
    robot.http('http://www.adultswim.com/videos/fishcenter')
      .get() (err, response, body) ->
        $ = cheerio.load(body)
        score_board = $('#scoreboard_table')
        leader = score_board.find('tbody tr:first-child')
        name = leader.find('td:first-child').text()
        total = leader.find('td:last-child').text()
        res.send ":#{name}: is currently in the lead with #{total} points"


  robot.respond /how many points does (.*) have/, (res) ->
    robot.http('http://www.adultswim.com/videos/fishcenter')
      .get() (err, response, body) ->
        name_map = 
          "sir squirt": 'sir_squirt'
          "ol' blue": "[class^=ol].Total"
          "ol blue": "[class^=ol].Total"
          "olblue": "[class^=ol].Total"
          "th'lump":  "[class^=th].Total"
          "thlump":  "[class^=th].Total"

        $ = cheerio.load(body)
        score_board = $('#scoreboard_table')
        match = fish = res.match[1]
        if name_map[fish]
          fish = name_map[fish] 
          total = score_board.find("#{fish}")
        else
          total = score_board.find(".#{fish}_Total")
        if total.length
          res.send "#{match} has #{total.text()} points" 
        else
          res.send "Sorry, couldn't find a score for #{match}"

