//
//  PatientTests.swift
//  TPLab10Tests
//
//  Created by Ilya Huzei on 04.06.2020.
//  Copyright © 2020 Ilya Huzei. All rights reserved.
//

import XCTest
import Foundation
@testable import TPLab10
class PatientTests: XCTestCase {

    var patient:Patient!
    override func setUp() {
        patient = Patient(name: "Alex Sidorov", login: "alex16", password: "qwerty")
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testName() {
        assert(patient.getName() == "Alex Sidorov")
    }
    
    func testLogin(){
        assert(patient.getLogin() == "alex16")
    }

    func testPassword(){
        assert(patient.getPassword() == "qwerty")
    }
}
