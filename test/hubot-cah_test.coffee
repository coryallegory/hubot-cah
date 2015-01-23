chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

describe 'hello-world', ->
  beforeEach ->
    @robot =
      respond: sinon.spy()
      hear: sinon.spy()

    require('../src/hubot-cah')(@robot)

  it 'registers a respond listener for "card me"', ->
    expect(@robot.respond).to.have.been.calledWithMatch sinon.match( (val) ->
      val.test 'card me'
    )
  it 'registers a respond listener for "card me 2"', ->
    expect(@robot.respond).to.have.been.calledWithMatch sinon.match( (val) ->
      val.test 'card me 2'
    )

  it 'registers a respond listener for "q card"', ->
    expect(@robot.respond).to.have.been.calledWithMatch sinon.match( (val) ->
      val.test 'q card'
    )

