//
//  ViewController.swift
//  SwiftRedux
//
//  Created by Roma Patel on 31/08/22.
//

import UIKit
import ReSwift

class ViewController: UIViewController, StoreSubscriber{

  @IBOutlet weak var placeHolder2Lbl: UILabel!
  @IBOutlet weak var placeholder1Lbl: UILabel!
  @IBOutlet weak var messageLbl: UILabel!
  var messageString : String? { didSet {
    self.messageLbl.text = messageString
  }
  }

  var complictionHandler : (()->Void)?

  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
  }

  func setup(){
    store.subscribe(self)
  }

  @IBAction func rockButton(_ sender: Any?) {
    store.dispatch(ChooseWeaponAction(weapon: .rock))
  }

  @IBAction func paperButton(_ sender: Any?) {
    store.dispatch(ChooseWeaponAction(weapon: .paper))
  }

  @IBAction func scissorsButton(_ sender: Any?) {
    store.dispatch(ChooseWeaponAction(weapon: .scissors))
  }

  func newState(state: AppState) {
    messageString =  state.message.rawValue
    complictionHandler?()

    if state.playerSecondPlay.chosen {
      placeholder1Lbl.text = state.playerFirstPlay.weapon?.rawValue
      placeHolder2Lbl.text = state.playerSecondPlay.weapon?.rawValue
    } else {
      placeholder1Lbl.text = state.playerFirstPlay.chosen ? "chosen" : ""
    }
  }
}

