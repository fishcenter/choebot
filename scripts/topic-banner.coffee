fs = require('fs')
cheerio = require('cheerio')
gm = require('gm')
imagemagick = gm.subClass({ imageMagick: true })

module.exports = (robot) ->
  robot.respond /change topic (.*)/, (res) ->
    fs.readFile './scripts/topic-template.svg','utf-8', (err, data) ->
      throw err if err
      $ = cheerio.load(data, xmlMode:true)
      $('#BANNER-RED').text(res.match[1])
      fs.writeFile './tmp/banner.svg', $.html(), (err, data) ->
        throw err if err
        imagemagick('./tmp/banner.svg')
          .write './tmp/banner.png', (err) ->
            throw err if err
            console.log 'it worked'




