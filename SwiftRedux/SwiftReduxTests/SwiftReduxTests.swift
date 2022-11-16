//
//  SwiftReduxTests.swift
//  SwiftReduxTests
//
//  Created by Roma Patel on 31/08/22.
//

import XCTest
@testable import SwiftRedux

class SwiftReduxTests: XCTestCase {

  var vc: ViewController!

  override func setUpWithError() throws {
    vc = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "ViewController") as? ViewController
    vc.loadView()
    vc.setup()
  }

  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }

//  func testExample() throws {
//
//    let expectation  =  expectation(description: "jhgjkfgf")
//    vc.rockButton(nil, compliction: {
//      expectation.fulfill()
//      let message = self.vc.messageString
//      XCTAssertEqual(message, "PLAYER 2 - Choose your weapon:", "Please check message string")
//    })
//    wait(for: [expectation], timeout: 10.0)
//
//  }

  func testPerformanceExample() throws {
    // This is an example of a performance test case.
    self.measure {
      // Put the code you want to measure the time of here.
    }
  }

}
