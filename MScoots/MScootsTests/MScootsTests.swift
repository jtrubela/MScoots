//
//  MScootsTests.swift
//  MScootsTests
//
//  Created by Justin Trubela on 3/22/23.
//

import XCTest

class MScootsTests: XCTestCase {
    

    var app: XCUIApplication!
    
    override func setUp() {
      super.setUp()

      continueAfterFailure = false

      app = XCUIApplication()
      app.launch()
    }

    override func tearDown() {
      super.tearDown()
      signOut()
    }

    func testAuth() {
      // Verify that Auth Example app launched successfully
      XCTAssertTrue(app.navigationBars["Firebase Auth"].exists)
    }

    func testAuthOptions() {
      // There are 12 sign in methods, each with its own cell
      XCTAssertEqual(app.tables.cells.count, 12)
    }

    func testAuthAnonymously() {
      app.staticTexts["Anonymous Authentication"].tap()

      wait(forElement: app.navigationBars["User"], timeout: 5.0)
      XCTAssertTrue(app.navigationBars["User"].exists)

      let isAnonymousCell = app.cells.containing(.staticText, identifier: "Is User Anonymous?")
        .element
      XCTAssertTrue(isAnonymousCell.staticTexts["Yes"].exists, "The user should be anonymous")
    }
    
//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }
//
//    func testExample() throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        // Any test you write for XCTest can be annotated as throws and async.
//        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
//        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
//    }
//
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
    
    func testAuthExistingAccount() {
        app.staticTexts["Email & Password Login"].tap()

        let testEmail = "test@test.com"
        app.textFields["Email"].tap()
        app.textFields["Email"].typeText(testEmail)

        let testPassword = "test12"
        app.textFields["Password"].tap()
        app.textFields["Password"].typeText(testPassword)

        app.buttons["Login"].tap()

        wait(forElement: app.navigationBars["User"], timeout: 5.0)
        XCTAssertTrue(app.navigationBars["User"].exists)
        XCTAssertTrue(
          app.staticTexts[testEmail].exists,
          "The user should be signed in and the email field should display their email."
        )
      }

      func testAuthExistingAccountWrongPassword() {
        app.staticTexts["Email & Password Login"].tap()

        let testEmail = "test@test.com"
        app.textFields["Email"].tap()
        app.textFields["Email"].typeText(testEmail)

        app.textFields["Password"].tap()
        app.textFields["Password"].typeText("wrong password")

        app.buttons["Login"].tap()

        wait(forElement: app.alerts.staticTexts["Error"], timeout: 5.0)
        XCTAssertTrue(app.alerts.staticTexts["Error"].exists)

        // Dismiss alert that password was incorrect
        app.alerts.buttons["OK"].tap()

        // Go back and check that there is no user that is signed in
        app.navigationBars.buttons.firstMatch.tap()
        app.tabBars.firstMatch.buttons.element(boundBy: 1).tap()
        wait(forElement: app.navigationBars["User"], timeout: 5.0)
        XCTAssertEqual(
          app.cells.count,
          0,
          "The user shouldn't be signed in and the user view should have no cells."
        )
      }

      func testCreateAccountBadPassword() {
        app.staticTexts["Email & Password Login"].tap()

        let testEmail = "test@test.com"
        app.textFields["Email"].tap()
        app.textFields["Email"].typeText(testEmail)

        app.textFields["Password"].tap()
        // Enter an invalid password that is "too short"
        app.textFields["Password"].typeText("2shrt")

        app.buttons["Create Account"].tap()

        wait(forElement: app.alerts.staticTexts["Error"], timeout: 5.0)
        XCTAssertTrue(app.alerts.staticTexts["Error"].exists)

        // Dismiss alert that password was incorrect
        app.alerts.buttons["OK"].tap()

        // Go back and check that there is no user that is signed in
        app.navigationBars.buttons.firstMatch.tap()
        app.tabBars.firstMatch.buttons.element(boundBy: 1).tap()
        wait(forElement: app.navigationBars["User"], timeout: 5.0)
        XCTAssertEqual(
          app.cells.count,
          0,
          "The user shouldn't be signed in and the user view should have no cells."
        )
      }

      func testCreateAlreadyExistingAccount() {
        app.staticTexts["Email & Password Login"].tap()

        let testEmail = "test@test.com"
        app.textFields["Email"].tap()
        app.textFields["Email"].typeText(testEmail)

        let testPassword = "test12"
        app.textFields["Password"].tap()
        app.textFields["Password"].typeText(testPassword)

        app.buttons["Create Account"].tap()

        wait(forElement: app.alerts.staticTexts["Error"], timeout: 5.0)
        XCTAssertTrue(app.alerts.staticTexts["Error"].exists)

        // Dismiss alert that password was incorrect
        app.alerts.buttons["OK"].tap()

        // Go back and check that there is no user that is signed in
        app.navigationBars.buttons.firstMatch.tap()
        app.tabBars.firstMatch.buttons.element(boundBy: 1).tap()
        wait(forElement: app.navigationBars["User"], timeout: 5.0)
        XCTAssertEqual(
          app.cells.count,
          0,
          "The user shouldn't be signed in and the user view should have no cells."
        )
      }

      func testCreateAccountCorrectPassword() {
        app.staticTexts["Email & Password Login"].tap()

        let newEmail = "\(Date().timeIntervalSince1970)_test@test.com"
        app.textFields["Email"].tap()
        app.typeText(newEmail)

        let newPassword = "new password"
        app.textFields["Password"].tap()
        app.typeText(newPassword)

        app.buttons["Create Account"].tap()

        wait(forElement: app.navigationBars["User"], timeout: 5.0)
        XCTAssertTrue(app.navigationBars["User"].exists)
        XCTAssertTrue(
          app.staticTexts[newEmail].exists,
          "The user should be signed into the new account."
        )
      }
    private func signOut() {
      app.tabBars.firstMatch.buttons.element(boundBy: 1).tap()
      wait(forElement: app.navigationBars["User"], timeout: 5.0)
      if app.staticTexts["Sign Out"].exists {
        app.staticTexts["Sign Out"].tap()
      }
      app.tabBars.firstMatch.buttons.element(boundBy: 0).tap()
    }
}

extension XCTestCase {
  func wait(forElement element: XCUIElement, timeout: TimeInterval) {
    let predicate = NSPredicate(format: "exists == 1")
    expectation(for: predicate, evaluatedWith: element)
    waitForExpectations(timeout: timeout)
  }
}
