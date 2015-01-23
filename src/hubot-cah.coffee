# Description:
#   Cards Against Humanity game managed by Hubot
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot cah help - List commands (https://github.com/coryallegory/hubot-cah)
#   hubot cah status - Current game status (https://github.com/coryallegory/hubot-cah)
#   hubot cah standings - List player scores for current game (https://github.com/coryallegory/hubot-cah)
#   hubot cah restart - Resets the game state (https://github.com/coryallegory/hubot-cah)
#   hubot cah register - Add self to the game (https://github.com/coryallegory/hubot-cah)
#   hubot cah unregister - Remove self from the game (https://github.com/coryallegory/hubot-cah)
#   hubot cah hand - List cards currently in your hand (https://github.com/coryallegory/hubot-cah)
#   hubot cah submit # # - Submit one or two cards for voting, depending how many are needed. # corresponds to the card id in your hand. The second # is optional. (https://github.com/coryallegory/hubot-cah)
#   hubot cah choose # - Choose the winning submission. # corresponds to the card choice id. (https://github.com/coryallegory/hubot-cah)
#
# Author:
#   Cory Metcalfe (corymetcalfe@gmail.com)

Cards = require './cards.coffee'

game = {}
# game states: 0=waiting, 1=submission, 2=choosing
reset_game = () ->
  game = {
    state: 0,
    names: [],
    scores_by_name: {},
    current_question: null,
    dealer_name: null,
    hands_by_name: {},
    submissions_by_name: {},
    choices: [],
    round_number: 0,
    round_start: null
}
reset_game()


update_hand_for_name = (name) ->
  hand = []
  submission = game.submissions_by_name[name]
  for phrase in game.hands_by_name[name]
    if phrase?
      if !submission? or submission.indexOf(phrase)<0
        hand.push phrase
  while hand.length < 5
    hand.push Cards.random_answer()
  game.hands_by_name[name] = hand


lock_submissions = () ->
  if game.state == 1
    game.state = 2
    game.choices = []
    for name in game.names
      submission = game.submissions_by_name[name]
      if submission?
        game.choices.push submission
    game.choices.sort()


time_remaining = () ->
  if game.state == 1
    seconds_passed = ((new Date).getTime() - game.round_start) / 1000
    seconds_remaining = 120 - seconds_passed
    return seconds_remaining
  return 0


new_round = (dealer_name) ->
  game.dealer_name = dealer_name
  game.current_question = Cards.random_question()
  game.round_number = game.round_number + 1
  game.round_start = (new Date).getTime()
  for name in game.names
    update_hand_for_name(name)
  game.state = 1

  return 'Round ' + game.round_number + ': ' + game.current_question



module.exports = (robot) ->
  

  robot.respond /cah help/, (msg) ->
    message = 'https://github.com/coryallegory/hubot-cah'
    message = message + 'cah help - List commands'
    message = message + 'cah status - Current game status'
    message = message + 'cah standings - List player scores for current game'
    message = message + 'cah restart - Resets the game state'
    message = message + 'cah register - Add self to the game'
    message = message + 'cah unregister - Remove self from the game'
    message = message + 'cah hand - List cards currently in your hand'
    message = message + 'cah submit # # - Submit one or two cards for voting, depending how many are needed. # corresponds to the card id in your hand. The second # is optional.'
    message = message + 'cah choose # - Choose the winning submission. # corresponds to the card choice id.'
    msg.send message
  

  robot.respond /cah status/, (msg) ->
    if game.state == 0
      msg.send 'Waiting for players to register.'
    if game.state == 1
      seconds_remaining = time_remaining()
      if seconds_remaining <= 0
        lock_submissions()
      else
        message = 'Round ' + game.round_number + ': ' + game.current_question
        message = '\n' + seconds_remaining + ' seconds remaining to submit answers for ' + game.player_names[game.current_dealer_name]
        msg.send message
    if game.state == 2
      message = 'Round ' + game.round_number + ': ' + game.current_question + '\n'
      message = message + game.names[game.dealer_name] + ', choose a submission:'
      for i in [0...game.choices.length] by 1
        choice = game.choices[i]
        message = message + '\n' + (i+1) + '. ' + choice
      msg.send message
    msg.send 'Something is wrong with the game, invalid state :/'


  robot.respond /cah standings/, (msg) ->
    if game.state == 1
      if time_remaining() <= 0
        lock_submissions()

    sort_by_score_asc = (a,b) ->
      return game.scores_by_name[a] - game.scores_by_name[b]
    game.names.sort(sort_by_score_asc)
    message = 'CAH Standings\n-------------'
    for i in [0...game.names.length] by 1
      name = game.names[i]
      message = message + '\n' + (i+1) + '. ' + name + '(' + game.scores_by_name[name] + ')'
    msg.send message


  robot.respond /cah restart/, (msg) ->
    reset_game()
    msg.send 'CAH has been reset.'


  robot.respond /cah register/, (msg) ->
    if game.state == 1
      if time_remaining() <= 0
        lock_submissions()

    player_name = msg.message.user.name.toLowerCase()
    
    if player_name in game.names
      message = '' + player_name + ' is already a player'
      score = game.scores_by_name[player_name]
      if score?
        message = message + ' with ' + score + ' points'
      message = message + '.'
      msg.send message
    else
      game.names.push player_name
      game.scores_by_name[player_name] = 0
      update_hand_for_name[player_name]

      message = '' + player_name + ' has been added.'

      if game.names.length == 1
        message = message + '\n' + new_round(player_name)

      msg.send message


  robots.respond /cah unregister/, (msg) ->
    if game.state == 1
      if time_remaining() <= 0
        lock_submissions()

    player_name = msg.message.user.name.toLowerCase()
    index = game.names.indexOf(player_name)
    if index? and index >= 0
      game.names.splice(index, 1)
      delete game.scores_by_name[player_name]
      delete game.submissions_by_name[player_name]
      delete game.hands_by_name[player_name]
      msg.send '' + player_name + ' has been removed.'
    else
      msg.send '' + player_name + ' is not registered.'


  robots.respond /cah hand/, (msg) ->
    if game.state == 1
      if time_remaining() <= 0
        lock_submissions()

    player_name = msg.message.user.name.toLowerCase()
    hand = game.hands_by_name[player_name]
    if !hand?
      msg.send 'You are not a registered player.'
    else
      submission = game.submissions_by_name[player_name]
      message = ''
      if submission?
        message = 'Currently submitted: ' + submission + '\n'
      for i in [0...hand.length] by 1
        card = Cards.answers[hand[i]]
        if i>0
          message = message + '\n'
        message = message + i + ' - ' + card
      msg.send message


  robots.respond /cah submit ([1-5]) ([1-5])?/, (msg) ->
    if game.state == 1
      if time_remaining() <= 0
        lock_submissions()

    player_name = msg.message.user.name.toLowerCase()
    if game.state != 1
      msg.send 'Now is not the time for submitting cards.'
    else
      if player_name === game.dealer_name
        msg.send 'You're the dealer, you do not get to submit this round.'
      else
        first = msg.match[1]
        second = msg.match[2]
        if !first?
          msg.send 'You need to choose a card from your hand.'
        else if second? and second === first
          msg.send 'You cannot use the same card twice.'
        else
          submission = first
          if second?
            submission = submission + ' / ' + second
          game.submissions_by_name[player_name] = submission

          if game.submissions.length === game.names
            lock_submissions()

          msg.send 'Submitted: ' + submission


  robots.respond /cah choose ([0-9])+/, (msg) ->
    if game.state != 2
      msg.send 'Now is not the time for choosing cards.'
    else
      player_name = msg.message.user.name.toLowerCase()
      if player_name !== game.dealer_name
        msg.send 'Only the dealer, ' + game.dealer_name + ', may choose.'
      else
        choice = msg.match[1]
        if choice < 1 or choice >= game.choices.length
          msg.send 'You've made an invalid choice.'
        else
          winner_name = null
          for name in game.names
            submission = game.submissions_by_name[name]
            if (submission? and submission === choice)
              winner_name = name
              break
          if winner_name?
            score = game.scores_by_name[winner_name]
            score = score + 1
            game.scores_by_name[winner_name] = score
            message = winner_name + ' wins!\n'
            message = message + new_round(winner_name)
            msg.send message

