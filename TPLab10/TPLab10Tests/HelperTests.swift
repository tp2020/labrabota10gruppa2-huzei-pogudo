//
//  HelperTests.swift
//  TPLab10Tests
//
//  Created by Ilya Huzei on 04.06.2020.
//  Copyright © 2020 Ilya Huzei. All rights reserved.
//

import XCTest
import Foundation
@testable import TPLab10
class HelperTests: XCTestCase {

    var helper:Helper = Helper(userLong: 10.0, userLat: 10.0)
    var hospitals = [Hospital]()
    override func setUp() {
         hospitals.append(Hospital(id: 3, name: "User3", longitude: 12.0, latitude: 12.0, img: UIImage(named:"Dep0")!))
        hospitals.append(Hospital(id: 1, name: "User1", longitude: 11.0, latitude: 11.0, img: UIImage(named:"Dep0")!))
        hospitals.append(Hospital(id: 2, name: "User2", longitude: 11.0, latitude: 10.0, img: UIImage(named:"Dep0")!))
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSort() {
        helper.sortByCoord(list: &hospitals)
        var correct:Bool = false
        if(hospitals[0].getId() == 2 && hospitals[1].getId() == 3 && hospitals[2].getId() == 1){
            correct = true
        }
       assert(correct)
    }

  

}
