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

  var placeHolderFirst : String? { didSet {
    self.placeholder1Lbl.text = placeHolderFirst
  }
  }

  var placeHolderSecond : String? { didSet {
    self.placeHolder2Lbl.text = placeHolderSecond
  }
  }

  var appatcteCalled : (()->Void)?
  var complictionHandler : (()->Void)?

  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
  }

  func setup(){
    store.subscribe(self)
  }

  @IBAction func rockButton(_ sender: Any?,  compliction: @escaping ()->Void) {
    self.appatcteCalled = compliction
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
    appatcteCalled?()
    if state.playerSecondPlay.chosen {
      placeHolderFirst = state.playerFirstPlay.weapon?.rawValue
      placeHolderSecond = state.playerSecondPlay.weapon?.rawValue
    } else {
      placeHolderFirst = state.playerFirstPlay.chosen ? "chosen" : ""
    }
  }
}

