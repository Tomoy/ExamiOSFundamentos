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
    
    var starkImage : UIImage!
    var lannisterImage : UIImage!
    
    var starkSigil : Sigil!
    var lannisterSigil : Sigil!
    
    var starkHouse : House!
    var lannisterHouse : House!
    
    var robb : Person!
    var arya : Person!
    var sansa : Person!
    var ned   : Person!

    
    var tyrion : Person!

    override func setUp() {
        
        super.setUp()
        
        starkImage = #imageLiteral(resourceName: "stark.png")
        lannisterImage = #imageLiteral(resourceName: "lannister.jpg")
        
        starkSigil = Sigil(description: "Direwolf", image: starkImage)
        lannisterSigil = Sigil(description: "Rampant Lion", image: lannisterImage)
        
        starkHouse = House(name: "Stark", sigil: starkSigil, words: "Winter is coming")
        lannisterHouse = House(name: "Lannister", sigil: lannisterSigil, words: "Hear me roar!")
        
        robb = Person(name: "Robb", alias: "The young wolf", house: starkHouse)
        arya = Person(name: "Arya", house: starkHouse)
        sansa = Person(name: "Sansa", house: starkHouse)
        ned = Person(name: "Eddard", alias: "Ned", house: starkHouse)
        
        tyrion = Person(name: "Tyrion", alias: "The Imp", house: lannisterHouse)
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCharacterExistance() {
        
        XCTAssertNotNil(ned)
    }
    
    func testFullName() {
        
        XCTAssertEqual(ned.fullName, "Eddard Stark")
    }
    
    func testPersonEquality() {
        
        //Identidad
        XCTAssertEqual(tyrion, tyrion)
        
        //Igualdad
        let imp = Person(name: "Tyrion", alias: "The Imp", house: lannisterHouse)
        
        XCTAssertEqual(imp, tyrion)
        
        //Desigualdad
        XCTAssertNotEqual(tyrion, arya)
    }
    
}
