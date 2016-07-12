#
# Description:
#   Cards Against Humanity game managed by Hubot
#   https://github.com/coryallegory/hubot-cah
#
# Dependencies:
#   None
#
# Commands:
#   hubot cah help - List cah commands
#   hubot cah black - Display a random black card
#   hubot cah white - Display a random white card
#   hubot cah play - Add yourself to the game
#   hubot cah retire - Remove yourself as an active player
#   hubot cah czar - Display name of the current Card Czar
#   hubot cah players - List active players
#   hubot cah leaders - Top five score leaders
#   hubot cah score - Display your score
#   hubot cah hand - List cards in your hand
#   hubot cah submit <#> <#> ... - Indicate white cards to be submitted as an answer, where # indicates card index in hand and amount of white cards submitted corresponds to the amount required by the current black card
#   hubot cah answers - List the current white card submissions for the current black card (Card Czar only)
#   hubot cah choose <#> - Choose a winning answer (Card Czar only)
#   hubot cah status - Display summary of current game
#   hubot cah skip - Discard current black card and assign a new Card Czar
#
# Author:
#   Cory Metcalfe (corymetcalfe@gmail.com)
#

helpSummary = "_hubot-cah commands:_"
helpSummary += "\ncah help - List cah commands"
helpSummary += "\ncah black - Display a random black card"
helpSummary += "\ncah white - Display a random white card"
helpSummary += "\ncah play - Add yourself to the game"
helpSummary += "\ncah retire - Remove yourself as an active player"
helpSummary += "\ncah czar - Display name of the current Card Czar"
helpSummary += "\ncah players - List active players"
helpSummary += "\ncah leaders - Top five score leaders"
helpSummary += "\ncah score - Display your score"
helpSummary += "\ncah hand - List cards in your hand"
helpSummary += "\ncah submit <#> <#> ... - Indicate white cards to be submitted as an answer, where # indicates card index in hand and amount of white cards submitted corresponds to the amount required by the current black card"
helpSummary += "\ncah answers - List the current white card submissions for the current black card (Card Czar only)"
helpSummary += "\ncah choose <#> - Choose a winning answer (Card Czar only)"
helpSummary += "\ncah status - Display summary of current game"
helpSummary += "\ncah skip - Discard current black card and assign a new Card Czar"


blackBlank = "_____"

blackCards = require('./blackcards.coffee')

whiteCards = require('./whitecards.coffee')

# @return black card text string
random_black_card = () ->
  cardIndex = Math.floor(Math.random()*blackCards.length)
  return blackCards[cardIndex]

# @return white card text string
random_white_card = () ->
  cardIndex = Math.floor(Math.random()*whiteCards.length)
  return whiteCards[cardIndex]

db = {
  scores:         {},                   # {<name>: <score>, ...}
  activePlayers:  [],                   # [<player name>, ...]
  blackCard:      random_black_card(),  # <card text>
  czar:           null,                 # <player name>
  hands:          {},                   # {<name>: [<card text>, <card text>, ...], ...}
  answers:        [],                   # [ [<player name>, [<card text>, ...]], ... ]
}

# prune inactive player hands, ensure everyone has five cards
fix_hands = () ->
  newHands = {}
  for own name, cardArray of db.hands
    if name in db.activePlayers
      while cardArray.length < 5
        cardArray.push random_white_card()
      newHands[name] = cardArray
  db["hands"] = newHands

# add player to active list
# fix their hand so it contains five cards
# if only player, make them czar
# @param playerName: name of player coming into game
add_player = (playerName) ->
  if playerName not in db.activePlayers
    db.activePlayers.push playerName
  if !db.scores[playerName]?
    db.scores[playerName] = 0
  cards = []
  while cards.length < 5
    cards.push random_white_card()
  db.hands[playerName] = cards
  if db.activePlayers.length == 1
    db.czar = playerName
    db.blackCard = random_black_card()

# remove player from active list
# remove any associated hands
# if they were czar, assign a new one
# @param playerName: name of player leaving the game
remove_player = (playerName) ->
  i = db.activePlayers.indexOf(playerName)
  if i >= 0
    db.activePlayers.splice(i,1)
  if db.hands[playerName]?
    delete db.hands[playerName]
  if db.czar == playerName
    if db.activePlayers.length == 0
      db.czar = null
    else if i >= db.activePlayers.length
      db.czar = db.activePlayers[0]
    else
      db.czar = db.activePlayers[i]

# combine black and white cards into complete phrase
# @param blackCard: black card text string
# @param whiteCards: array of white card text strings
# @return completed string
generate_phrase = (blackCard, whiteCards) ->
  phrase = ""
  blackBits = blackCard.split blackBlank
  if blackBits.length == 1
    phrase += "#{blackCard} *#{whiteCards[0]}*"
  else
    wi = 0
    bi = 0
    if blackCard.substring(0, blackBlank.length) == blackBlank
      phrase += "*#{whiteCards[0].match(/(.*[a-zA-Z0-9])[^a-zA-Z0-9]*$/i)[0]}*"
      wi = 1
    while wi < whiteCards.length or bi < blackBits.length
      if bi < blackBits.length
        phrase += blackBits[bi]
        bi++
      if wi < whiteCards.length
        phrase += "*#{whiteCards[wi].match(/(.*[a-zA-Z0-9])[^a-zA-Z0-9]*$/i)[0]}*"
        wi++
  return phrase

# remove cards from player hand and add to answers
# @param playerName: player submitting answer
# @param handIndices: indices of cards in player hand
submit_answer = (playerName, handIndices) ->
  playerHand = db.hands[playerName]
  cards = []
  for i in handIndices
    cards.push playerHand[i]
  for card in cards
    i = playerHand.indexOf(card)
    playerHand.splice(i,1)
  db.answers.push [playerName, cards]

# specify winning card and reset game for next round
# @param answerIndex: if value outside db.answers array range, no winner this round
# @return string for public display
czar_choose_winner = (answerIndex) ->
  responseString = "Next round:"
  if 0 <= answerIndex and answerIndex < db.answers.length
    responseString = "*#{db.blackCard}*"
    for answer in db.answers
      responseString += "\n#{answer[1][0]}"
      responseString += ", #{answer[1][i]}" for i in [1...answer[1].length]

    winner = db.answers[answerIndex][0]
    cards = db.answers[answerIndex][1]
    winningPhrase = generate_phrase(db.blackCard, cards)

    responseString += "\n\n#{winner} earns a point for\n*#{winningPhrase}*"

    if !db.scores[winner]?
      db.scores[winner] = 1
    else
      db.scores[winner] = db.scores[winner] + 1

  db["answers"] = []
  fix_hands()
  db["blackCard"] = random_black_card()
  if db.activePlayers.length == 0
    db.czar = null
  else if !db.czar?
    db.czar = db.activePlayers[0]
  else
    czarIndex = db.activePlayers.indexOf db.czar
    if czarIndex < 0 or czarIndex == db.activePlayers.length-1
      db.czar = db.activePlayers[0]
    else
      db.czar = db.activePlayers[czarIndex+1]
  return responseString + "\n\nNext round:\n" + game_state_string()

# generate string describing game state
# czar, black card, number of submissions
game_state_string = () ->
  if !db.czar?
    return "Waiting for players."
  else
    return "*#{db.blackCard}* [#{db.czar}, #{db.answers.length}/#{db.activePlayers.length-1}]"

# @param msg: message object
# @return name of message sender
sender = (msg) ->
  return msg.message.user.name


module.exports = (robot) ->

  robot.respond /cah help$/i, (msg) ->
    msg.send helpSummary

  robot.respond /cah black$/i, (msg) ->
    msg.send random_black_card()

  robot.respond /cah white$/i, (msg) ->
    msg.send random_white_card()

  robot.respond /cah play$/i, (msg) ->
    name = sender(msg)
    add_player(name)
    msg.reply "You are now an active CAH player."

  robot.respond /cah retire$/i, (msg) ->
    name = sender(msg)
    remove_player(name)
    msg.reply "You are no longer a CAH player. Your score will be preserved should you decide to play again."

  robot.respond /cah czar$/i, (msg) ->
    if db.czar?
      msg.send db.czar
    else
      msg.send "No Card Czar yet, waiting for players."

  robot.respond /cah players$/i, (msg) ->
    if db.activePlayers.length < 1
      msg.send "Waiting for players."
    else
      responseString = "CAH Players: #{db.activePlayers[0]}"
      for i in [1...db.activePlayers.length] by 1
        responseString += ", #{db.activePlayers[i]}"
      msg.send responseString

  robot.respond /cah leaders$/i, (msg) ->
    scoreTuples = []
    for name,score of db.scores
      scoreTuples.push([name,score])
    scoreTuples.sort (a,b) ->
      a = a[1]
      b = b[1]
      return a < b ? -1 : (a > b ? 1 : 0)

    responseString = "CAH Leaders:"
    for i in [0...5] by 1
      if i >= scoreTuples.length
        break
      responseString += "\n#{scoreTuples[i][1]} #{scoreTuples[i][0]}"
    msg.send responseString

  robot.respond /cah score$/i, (msg) ->
    score = db.scores[sender(msg)]
    if score?
      msg.reply score
    else
      msg.reply "No CAH score on record."

  robot.respond /cah hand$/i, (msg) ->
    cards = db.hands[sender(msg)]
    responseString = "Your white CAH cards:"
    if cards?
      for i in [0...cards.length] by 1
        responseString += "\n#{i}: #{cards[i]}"
    msg.reply responseString

  robot.respond /cah submit(?: ([0-4]+))+$/i, (msg) ->
    if sender(msg) == db.czar
      msg.reply "You are currently the Card Czar!"
      return
    if db.hands[sender(msg)].length < 5
      msg.reply "You have already submitted cards for this round."
      return
    numString = msg.match[0].split("submit ")[1]
    nums = numString.split(" ")
    expectedCount = db.blackCard.split(blackBlank).length - 1
    if expectedCount == 0
      expectedCount = 1
    if nums.length != expectedCount
      msg.reply "You submitted #{nums.length} cards, #{expectedCount} expected."
    else
      for i in [0...nums.length] by 1
        nums[i] = parseInt(nums[i])
        if nums[i] >= db.hands[sender(msg)].length
          msg.reply "#{nums[i]} is not a valid card number."
          return
      for i in [0...nums.length] by 1
        for j in [i+1...nums.length] by 1
          if nums[i] == nums[j]
            msg.reply "You cannot submit a single card more than once."
            return
      submit_answer(sender(msg), nums)
      msg.reply "Submission accepted."

  robot.respond /cah answers$/i, (msg) ->
    if sender(msg) != db.czar
      msg.reply "Only the Card Czar may see the white card submissions."
    else
      answers = db.answers
      responseString = "White card submissions thus far:"
      for i in [0...answers.length] by 1
        cards = answers[i][1]
        responseString += "\n#{i}: #{generate_phrase(db.blackCard, cards)}"
      msg.reply responseString

  robot.respond /cah choose ([0-9]+)$/i, (msg) ->
    if sender(msg) != db.czar
      msg.reply "Only the Card Czar may choose a winner."
    else if db.answers.length == 0
      msg.reply "No submissions to choose from yet."
    else
      num = parseInt(msg.match[1])
      if num < 0 or num >= db.answers.length
        msg.reply "That is not an valid choice, try again."
      else
        msg.send czar_choose_winner num

  robot.respond /cah status$/i, (msg) ->
    msg.send game_state_string()

  robot.respond /cah skip$/i, (msg) ->
    msg.send czar_choose_winner -1
