//
//  Reducers.swift
//  SwiftRedux
//
//  Created by Roma Patel on 31/08/22.
//

import ReSwift

// MARK: REDUCERS

func appReducer(action: Action, state: AppState?) -> AppState {

  var state = state ?? AppState()

  switch action {
  case let chooseWeaponAction as ChooseWeaponAction:

    let turn = state.turn
    switch turn.player {
    case .one:

      let play = Play(chosen: true, weapon: chooseWeaponAction.weapon)
      state.playerFirstPlay = play

      state.turn = Turn(player: .two)
      state.message = .player2choose

    case .two:

      let play = Play(chosen: true, weapon: chooseWeaponAction.weapon)
      state.playerSecondPlay = play

      let player1Weapon = state.playerFirstPlay.weapon ?? .rock
      let player2Weapon = state.playerSecondPlay.weapon ?? .rock

      switch player1Weapon {
      case .rock:
        switch player2Weapon {
        case .rock:
          state.result = .draw
          state.message = .draw
        case .paper:
          state.result = .player2Wins
          state.message = .player2Wins
        case .scissors:
          state.result = .player1Wins
          state.message = .player1Wins
        }
      case .paper:
        switch player2Weapon {
        case .rock:
          state.result = .player1Wins
          state.message = .player1Wins
        case .paper:
          state.result = .draw
          state.message = .draw
        case .scissors:
          state.result = .player2Wins
          state.message = .player2Wins
        }
      case .scissors:
        switch player2Weapon {
        case .rock:
          state.result = .player2Wins
          state.message = .player2Wins
        case .paper:
          state.result = .player1Wins
          state.message = .player1Wins
        case .scissors:
          state.result = .draw
          state.message = .draw
        }
      }
    }
  default:
    break
  }

  return state
}
