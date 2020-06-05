//
//  HospitalTests.swift
//  TPLab10Tests
//
//  Created by Ilya Huzei on 04.06.2020.
//  Copyright © 2020 Ilya Huzei. All rights reserved.
//

import XCTest
import Foundation
@testable import TPLab10
class HospitalTests: XCTestCase {

    var hospital:Hospital!
    override func setUp() {
    hospital = Hospital(id: 1, name: "Ilya", longitude: 10.0, latitude: 10.0, img: UIImage(named:"Dep0")!,isAdult: true)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testIsAdult() {
        XCTAssertTrue(hospital.getIsAdult())
    }
    
    func testId(){
        assert(hospital.getId() == 1)
    }
    
    func testLong(){
        assert(hospital.getLongitude() == 10.0)
    }
    
    func testLat(){
        assert(hospital.getLatitude() == 10.0)
    }
    


   

}
