# Description:
#   Infomercials
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   info me
#
# Author:
#   tomszymanski
infomercial = [
  "http://i.imgur.com/InuUEBT.gif",
  "http://i.imgur.com/3bglyBB.gif",
  "http://i.imgur.com/MHjdrhG.gif",
  "http://i.imgur.com/TOnVqtK.gif",
  "http://i.imgur.com/fJBRMl2.gif",
  "http://i.imgur.com/nZLvy2K.gif",
  "http://i.imgur.com/U1In3jK.gif",
  "http://i.imgur.com/haQkkpc.gif",
  "http://i.imgur.com/Ag7DTzC.gif",
  "http://i.imgur.com/RHYCsUu.gif",
  "http://i.imgur.com/lsUszX8.gif",
  "http://i.imgur.com/ydmMiRi.gif",
  "http://i.imgur.com/dqLMyHO.gif",
  "http://i.imgur.com/M0Y0zs5.gif",
  "http://i.imgur.com/S8N2M0m.gif",
  "http://i.imgur.com/BM6z1xk.gif",
  "http://i.imgur.com/UwOBvRU.gif",
  "http://i.imgur.com/HDKME1d.gif",
  "http://i.imgur.com/ZLC7Ma7.gif",
  "http://i.imgur.com/qTAOtC5.gif",
  "http://i.imgur.com/d7lGARs.gif",
  "http://i.imgur.com/9eyaAQW.gif",
  "http://i.imgur.com/Awdr31b.gif",
  "http://i.imgur.com/90IB9ZA.gif",
  "http://i.imgur.com/BnyaxDZ.gif",
  "http://i.imgur.com/PdhZvLo.gif",
  "http://i.imgur.com/RDjbTO3.gif",
  "http://i.imgur.com/sqQkLGS.gif",
  "http://i.imgur.com/wu2W0HX.gif",
  "http://i.imgur.com/1eoEh0a.gif",
  "http://i.imgur.com/VmoUtdN.gif",
  "http://i.imgur.com/Oy88ZRu.gif",
  "http://i.imgur.com/xo0GYqb.gif",
  "http://i.imgur.com/aKQg48e.gif",
  "http://i.imgur.com/F3dSLdd.gif",
  "http://i.imgur.com/2SW4nsn.gif",
  "http://i.imgur.com/sWmiSyL.gif",
  "http://i.imgur.com/e5AUbYx.gif",
  "http://i.imgur.com/93QH9ct.gif",
  "http://i.imgur.com/kWtVTWp.gif",
  "http://media.heavy.com/media/2013/04/AqkJn.gif",
  "http://media.heavy.com/media/2013/04/aNvsU.gif",
  "http://25.media.tumblr.com/tumblr_mcoqsuBUvW1rje5o6o1_250.gif",
  "http://24.media.tumblr.com/328ed6f958bc4c37a1ad16858c9f1620/tumblr_mk18ez68Lh1qjf4x5o1_r2_250.gif",
  "http://weknowgifs.com/wp-content/uploads/2013/03/informercial-gif-guy-putting-on-shoe.gif",
  "http://25.media.tumblr.com/tumblr_mcdkb8wk4X1qh8t5wo9_250.gif",
  "http://media.heavy.com/media/2013/04/9CnFy.gif",
  "http://25.media.tumblr.com/tumblr_mdf2i231dH1rje5o6o1_400.gif",
  "http://i.imgur.com/V7QDjLm.gif",
  "http://rack.1.mshcdn.com/media/ZgkyMDEzLzAzLzI0LzBmL2FmbDlMbE0xLjZmN2I3LmdpZgpwCXRodW1iCTEyMDB4OTYwMD4/8b6c7760/7f2/afl9LlM1.gif",
  "http://rack.3.mshcdn.com/media/ZgkyMDEzLzAzLzI0LzA4L3lkbU1pUmkuODkwNzIuZ2lmCnAJdGh1bWIJMTIwMHg5NjAwPg/9f2d315a/604/ydmMiRi.gif",
  "http://mashable.com/wp-content/uploads/2013/03/9eyaAQW.gif",
  "http://i.imgur.com/aTDcl.gif",
  "http://i.imgur.com/iBfDL.gif",
  "http://i.imgur.com/oT2CN.gif"
]

module.exports = (robot) ->
  robot.respond /info me/i, (msg) ->
    msg.reply msg.random infomercial
