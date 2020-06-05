//
//  DBTests.swift
//  TPLab10Tests
//
//  Created by Ilya Huzei on 04.06.2020.
//  Copyright © 2020 Ilya Huzei. All rights reserved.
//

import XCTest
import Foundation
@testable import TPLab10
class DBTests: XCTestCase {

    var dbConnector:DataBaseHandler!
    override func setUp() {
        dbConnector = DataBaseHandler()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        let db:OpaquePointer? = dbConnector.openDb()
        if(db == nil){
            assert(false)
        }
         assert(dbConnector.closeDb(db: db))
    }

    

}
