# Description:
#   Tip people with dogecoins!
# ░░░░░░░░░▄░░░░░░░░░░░░░░▄░░░░
# ░░░░░░░░▌▒█░░░░░░░░░░░▄▀▒▌░░░
# ░░░░░░░░▌▒▒█░░░░░░░░▄▀▒▒▒▐░░░
# ░░░░░░░▐▄▀▒▒▀▀▀▀▄▄▄▀▒▒▒▒▒▐░░░
# ░░░░░▄▄▀▒░▒▒▒▒▒▒▒▒▒█▒▒▄█▒▐░░░
# ░░░▄▀▒▒▒░░░▒▒▒░░░▒▒▒▀██▀▒▌░░░
# ░░▐▒▒▒▄▄▒▒▒▒░░░▒▒▒▒▒▒▒▀▄▒▒▌░░
# ░░▌░░▌█▀▒▒▒▒▒▄▀█▄▒▒▒▒▒▒▒█▒▐░░
# ░▐░░░▒▒▒▒▒▒▒▒▌██▀▒▒░░░▒▒▒▀▄▌░
# ░▌░▒▄██▄▒▒▒▒▒▒▒▒▒░░░░░░▒▒▒▒▌░
# ▀▒▀▐▄█▄█▌▄░▀▒▒░░░░░░░░░░▒▒▒▐░
# ▐▒▒▐▀▐▀▒░▄▄▒▄▒▒▒▒▒▒░▒░▒░▒▒▒▒▌
# ▐▒▒▒▀▀▄▄▒▒▒▄▒▒▒▒▒▒▒▒░▒░▒░▒▒▐░
# ░▌▒▒▒▒▒▒▀▀▀▒▒▒▒▒▒░▒░▒░▒░▒▒▒▌░
# ░▐▒▒▒▒▒▒▒▒▒▒▒▒▒▒░▒░▒░▒▒▄▒▒▐░░
# ░░▀▄▒▒▒▒▒▒▒▒▒▒▒░▒░▒░▒▄▒▒▒▒▌░░
# ░░░░▀▄▒▒▒▒▒▒▒▒▒▒▄▄▄▀▒▒▒▒▄▀░░░
# ░░░░░░▀▄▄▄▄▄▄▀▀▀▒▒▒▒▒▄▄▀░░░░░
# ░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▀▀░░░░░░░░
#
# Dependencies:
#   ENV Vars
#     HIPCHAT_TOKEN=
#     TIPBOT_AUTH_TOKEN=
#     TIPBOT_URL=
#
# Configuration:
#   None
#
# Commands:
#   - tipbot register (register to use tipbot - only needed if you have never been tipped)
#   - tipbot address (show the address you can send coins to for tipping)
#   - tipbot balance (show your current balance)
#   - tipbot history (show transaction history)
#   - tipbot tip @mentionName # (tip someone coins e.g. tipbot tip @TravisBerry 10)
#   - tipbot withdraw personalAddress (withdraw your tips into your personal wallet)
# 
# Author:
#   Travis Berry
# 
# WARNING:
#   This is a pretty basic start to this script. Don't keep large amounts of dogecoins in this app!
HipchatClient = require('hipchat-client')
crypto = require('crypto')
HipChat = new HipchatClient(process.env.HIPCHAT_TOKEN)


module.exports = (robot) ->
  # register with tipbot
  robot.hear /tipbot register/i, (msg) ->
    HipChat.getMailByMentionName msg.message.user.mention_name, (email) ->
      console.log email
      from_hash = crypto.createHash('md5').update(email).digest('hex')
      console.log "#{from_hash} is registering"
      msg.http("#{process.env.TIPBOT_URL}/wallet/#{from_hash}/register")
        .headers(Authorization: process.env.TIPBOT_AUTH_TOKEN, Accept: 'application/json')
        .get() (err, res, body) ->
          object = JSON.parse(body)
          console.log object
          # msg.send object.address

    msg.send "#{msg}"

  # get address to send coins to
  robot.hear /tipbot address/i, (msg) ->
    HipChat.getMailByMentionName msg.message.user.mention_name, (email) ->
      console.log email
      from_hash = crypto.createHash('md5').update(email).digest('hex')
      msg.http("#{process.env.TIPBOT_URL}/wallet/#{from_hash}")
        .headers(Authorization: process.env.TIPBOT_AUTH_TOKEN, Accept: 'application/json')
        .get() (err, res, body) ->
          object = JSON.parse(body)
          console.log object
          msg.send object.address

  # get current balance
  robot.hear /tipbot balance/i, (msg) ->
    HipChat.getMailByMentionName msg.message.user.mention_name, (email) ->
      console.log email
      from_hash = crypto.createHash('md5').update(email).digest('hex')
      msg.http("#{process.env.TIPBOT_URL}/wallet/#{from_hash}/balance")
        .headers(Authorization: process.env.TIPBOT_AUTH_TOKEN, Accept: 'application/json')
        .get() (err, res, body) ->
          object = JSON.parse(body)
          console.log object
          msg.send "You have #{object.balance} dogecoins"

  # get transaction history
  robot.hear /tipbot history/i, (msg) ->
    HipChat.getMailByMentionName msg.message.user.mention_name, (email) ->
      console.log email
      from_hash = crypto.createHash('md5').update(email).digest('hex')
      msg.http("#{process.env.TIPBOT_URL}/wallet/#{from_hash}/history")
        .headers(Authorization: process.env.TIPBOT_AUTH_TOKEN, Accept: 'application/json')
        .get() (err, res, body) ->
          object = JSON.parse(body)
          console.log object
          msg.send body

  # tip someone
  robot.hear /tipbot tip (.\S*) (.\d*)/i, (msg) ->
    to_name = msg.match[1].trim()
    amount = msg.match[2]

    HipChat.getMailByMentionName msg.message.user.mention_name, (email) ->
      console.log email
      from_hash = crypto.createHash('md5').update(email).digest('hex')

      HipChat.getMailByMentionName to_name.substring(1), (email) ->
        to_hash = crypto.createHash('md5').update(email).digest('hex')
        console.log from_hash
        console.log "tipping #{to_hash}"

        data = JSON.stringify({from: from_hash, to: to_hash, amount: amount})
        msg.http("#{process.env.TIPBOT_URL}/wallet/tip")
          .headers('Authorization': process.env.TIPBOT_AUTH_TOKEN, 'Accept': 'application/json', 'Content-Type': 'application/json')
          .post(data) (err, res, body) ->
            object = JSON.parse(body)
            console.log object
            msg.send "Tip sent!"

  # withdraw coins to personal wallet
  robot.hear /tipbot withdraw (.*)/i, (msg) ->
    wallet_address = msg.match[1]
    console.log wallet_address

    HipChat.getMailByMentionName msg.message.user.mention_name, (email) ->
      console.log email
      from_hash = crypto.createHash('md5').update(email).digest('hex')
      msg.http("#{process.env.TIPBOT_URL}/wallet/#{from_hash}/withdraw/#{wallet_address}")
        .headers(Authorization: process.env.TIPBOT_AUTH_TOKEN, Accept: 'application/json')
        .get() (err, res, body) ->
          object = JSON.parse(body)
          console.log object
          msg.send object.message
