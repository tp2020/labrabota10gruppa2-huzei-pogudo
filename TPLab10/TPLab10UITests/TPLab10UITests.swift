//
//  TPLab10UITests.swift
//  TPLab10UITests
//
//  Created by Ilya Huzei on 02.06.2020.
//  Copyright © 2020 Ilya Huzei. All rights reserved.
//

import XCTest

class TPLab10UITests: XCTestCase {

    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        XCUIApplication().launch()
            // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func testLoginSuccess() {
       let app = XCUIApplication()
        var userNameTextfield =  app.textFields["login"]
        if(!userNameTextfield.exists){
            app.buttons["Back"].tap()
        }
        userNameTextfield =  app.textFields["login"]
        
        XCTAssert(userNameTextfield.exists)
        userNameTextfield.tap()
        userNameTextfield.typeText("iliuha1907")
        
        let passwordTextField = app.textFields["password"]
         XCTAssert(userNameTextfield.exists)
        passwordTextField.tap()
        passwordTextField.tap()
        passwordTextField.typeText("qwerty")
        app.buttons["Log in"].tap()
      
        XCTAssert(app.buttons["Hospitals"].exists)
        app.buttons["Back"].tap()
         // app.buttons["Back"].tap()
        
    }
    
    func testLogFail(){
        
       XCUIApplication().launch()
       let app = XCUIApplication()
       var userNameTextfield =  app.textFields["login"]
       if(!userNameTextfield.exists){
            app.buttons["Back"].tap()
       }
       userNameTextfield =  app.textFields["login"]
        
       XCTAssert(userNameTextfield.exists)
       userNameTextfield.tap()
       userNameTextfield.typeText("iliuha")
                  
       let passwordTextField = app.textFields["password"]
       XCTAssert(userNameTextfield.exists)
       passwordTextField.tap()
     //  passwordTextField.tap()
       passwordTextField.typeText("12345")
       app.buttons["Log in"].tap()
       XCTAssert(app.alerts["Error"].exists)
    }
    
    func testPolyclinics(){
       
        let app = XCUIApplication()
        var userNameTextfield =  app.textFields["login"]
         if(!userNameTextfield.exists){
            app.buttons["Back"].tap()
            
        }
        userNameTextfield = app.textFields["login"]
        XCTAssert(userNameTextfield.exists)
        userNameTextfield.tap()
        userNameTextfield.typeText("iliuha1907")
        let passwordTextField = app.textFields["password"]
        XCTAssert(userNameTextfield.exists)
        passwordTextField.tap()
        passwordTextField.tap()
        passwordTextField.typeText("qwerty")
        app.buttons["Log in"].tap()
        XCTAssert(app.buttons["Hospitals"].exists)
        app.buttons["Polyclinics"].tap()
        XCTAssert(app.collectionViews.cells.otherElements.containing(.staticText, identifier:"Polyclinic №8").element.exists)
        app.collectionViews.cells.otherElements.containing(.staticText, identifier:"Polyclinic №8").element.tap()
        XCTAssert(app.buttons["Enroll for the reception"].exists)
        app.buttons["Enroll for the reception"].tap()
        app.datePickers/*@START_MENU_TOKEN@*/.pickerWheels["Wed, Jun 10"]/*[[".pickers.pickerWheels[\"Wed, Jun 10\"]",".pickerWheels[\"Wed, Jun 10\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssert(app.buttons["Register"].exists)
        app.buttons["Register"].tap()
        XCTAssert(app.buttons["Back"].exists)
        let backButton = app.buttons["Back"]
        backButton.tap()
        backButton.tap()
        backButton.tap()
        backButton.tap()
        
    }
    
    func testHospital(){
        
        let app = XCUIApplication()
        var userNameTextfield =  app.textFields["login"]
        if(!userNameTextfield.exists){
            app.buttons["Back"].tap()
        }
        userNameTextfield =  app.textFields["login"]
        XCTAssert(userNameTextfield.exists)
        userNameTextfield.tap()
        userNameTextfield.typeText("iliuha1907")
        let passwordTextField = app.textFields["password"]
        XCTAssert(userNameTextfield.exists)
        passwordTextField.tap()
        passwordTextField.tap()
        passwordTextField.typeText("qwerty")
        app.buttons["Log in"].tap()
        XCTAssert(app.buttons["Hospitals"].exists)
        app.buttons["Hospitals"].tap()
        XCTAssert( app.collectionViews.cells.otherElements.containing(.staticText, identifier:"hospital №1").element.exists)
        app.collectionViews.cells.otherElements.containing(.staticText, identifier:"hospital №1").element.tap()
        
        let backButton = app.buttons["Back"]
        backButton.tap()
        backButton.tap()
        backButton.tap()
    }

   
}
