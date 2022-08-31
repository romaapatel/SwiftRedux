//
//  State.swift
//  SwiftRedux
//
//  Created by Roma Patel on 31/08/22.
//

import ReSwift

// MARK:- STATE
struct AppState {

  var message: Message
  var turn: Turn
  var playerFirstPlay: Play
  var playerSecondPlay: Play
  var result: Result?

  init() {

    self.message = .player1choose
    self.turn = Turn(player: .one)
    self.playerFirstPlay = Play(chosen: false, weapon: nil)
    self.playerSecondPlay = Play(chosen: false, weapon: nil)
  }
}


enum Message: String {

  case player1choose = "PLAYER 1 - Choose your weapon:"
  case player2choose = "PLAYER 2 - Choose your weapon:"
  case player1Wins = "PLAYER 1 WINS!"
  case player2Wins = "PLAYER 2 WINS!"
  case draw = "Draw!"
}

struct Turn {

  var player: Player
}

enum Player {

  case one
  case two
}

struct Play {

  var chosen: Bool
  var weapon: Weapon?
}

enum Result {

  case draw
  case player1Wins
  case player2Wins
}

enum Weapon : String {

  case rock = "Rock"
  case paper = "Paper"
  case scissors = "Scissors"
}
