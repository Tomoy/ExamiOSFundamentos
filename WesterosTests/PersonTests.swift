//
//  CharacterTests.swift
//  Westeros
//
//  Created by Tomás Ignacio Moyano on 7/6/17.
//  Copyright © 2017 Tomás Ignacio Moyano. All rights reserved.
//

import XCTest
@testable import Westeros

class PersonTests: XCTestCase {
    
    var starkHouse:House!
    var startkMembers:[Person] = []

    override func setUp() {
        
        super.setUp()
        
        starkHouse = Repository.local.house(named: "Stark")
        startkMembers = (starkHouse?.sortedMembers())!
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCharacterExistance() {
        
        XCTAssertNotNil(startkMembers[0])
    }
    
    func testFullName() {
        
        let ned = Person(name: "Eddard", alias: "Ned", house: starkHouse!)

        XCTAssertEqual(ned.fullName, "Eddard Stark")
    }
    
    func testPersonEquality() {
        
        let lannisterHouse = Repository.local.house(named: "Lannister")
        let tyrion = Person(name: "Tyrion", alias: "The Imp", house: lannisterHouse!)

        //Identidad
        XCTAssertEqual(tyrion, tyrion)
        
        //Igualdad
        let imp = Person(name: "Tyrion", alias: "The Imp", house: lannisterHouse!)
        
        XCTAssertEqual(imp, tyrion)
        
        //Desigualdad
        XCTAssertNotEqual(tyrion, startkMembers[1])
    }
    
}
