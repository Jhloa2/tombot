# Display a random "haters gonna hate" image
#
# haters - Returns a random haters gonna hate url
#
#
haters = [
  "http://www.hatersgoingtohate.com/wp-content/uploads/2010/06/haters-gonna-hate-rubberband-ball.jpg", 
"http://www.hatersgoingtohate.com/wp-content/uploads/2010/06/haters-gonna-hate-cat.jpg", 
"http://jesad.com/img/life/haters-gonna-hate/haters-gonna-hate01.jpg", 
"http://i671.photobucket.com/albums/vv78/Sinsei55/HatersGonnaHatePanda.jpg", 
"http://24.media.tumblr.com/tumblr_lltwmdVpoL1qekprfo1_500.gif", 
"http://s3.amazonaws.com/kym-assets/photos/images/newsfeed/000/087/536/1292102239519.gif", 
"http://i391.photobucket.com/albums/oo351/PikaPow3/squirtle.gif",
"http://hubot-assets.s3.amazonaws.com/haters/1.png"
]

hatin = (msg) ->
  msg.send msg.random haters

module.exports = (robot) ->
  robot.respond /haters/i, (msg) ->
    hatin msg
  robot.hear /haters gonna hate/i, (msg) ->
    hatin msg