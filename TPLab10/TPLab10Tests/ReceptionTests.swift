//
//  ReceptionTests.swift
//  TPLab10Tests
//
//  Created by Ilya Huzei on 04.06.2020.
//  Copyright © 2020 Ilya Huzei. All rights reserved.
//

import XCTest
import Foundation
@testable import TPLab10
class ReceptionTests: XCTestCase {

    var reception:Reception!
    override func setUp() {
        reception = Reception(id: 1, date: "01.01.2020 12:00", patient_id: 1, polyclinic_id: 1, doctor: "Therapist")
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testId() {
        assert(reception.getId() == 1)
    }
    
    func testDate(){
        assert(reception.getDate() == "01.01.2020 12:00")
    }
    
    func testPatId(){
        assert(reception.getPtientId() == 1)
    }
    
    func testPolId(){
        assert(reception.getPolyclinicId() == 1)
    }
    
    func testDoc(){
        assert(reception.getDoctor() == "Therapist")
    }

    

}
