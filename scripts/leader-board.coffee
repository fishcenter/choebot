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

