//
//  RepositoryTests.swift
//  Westeros
//
//  Created by Tomás Ignacio Moyano on 7/11/17.
//  Copyright © 2017 Tomás Ignacio Moyano. All rights reserved.
//

import XCTest

@testable import Westeros

class RepositoryTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // Hago los tests de lo que voy a crear, antes de crearlo, porque voy a querer que una clase Repository, 
    // tenga una propiedad local que a su vez guarde las casas
    func testLocalRepositoryCreation() {
        XCTAssertNotNil(Repository.local)
    }
    
    func testLocalRepositoryHousesCreation() {
        let houses = Repository.local.houses
        XCTAssertNotNil(houses)
        XCTAssertEqual(houses.count, 2)
    }
}
