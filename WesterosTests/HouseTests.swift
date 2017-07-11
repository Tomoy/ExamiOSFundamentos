//
//  HouseTests.swift
//  Westeros
//
//  Created by Tomás Ignacio Moyano on 7/6/17.
//  Copyright © 2017 Tomás Ignacio Moyano. All rights reserved.
//

import XCTest

@testable import Westeros

class HouseTests: XCTestCase {
    
    var starkImage : UIImage!
    var lannisterImage : UIImage!
    
    var starkSigil : Sigil!
    var lannisterSigil : Sigil!
    
    var starkHouse : House!
    var lannisterHouse : House!
    
    var robb : Person!
    var arya : Person!
    var sansa : Person!

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

        tyrion = Person(name: "Tyrion", alias: "The Imp", house: lannisterHouse)
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testHouseExistance() {
        
        XCTAssertNotNil(Repository.local.houses[1])
    }
    
    func testSigilExistance() {
        
        XCTAssertNotNil(starkSigil)
        XCTAssertNotNil(lannisterSigil)
    }
    
    func testAddPersons() {
        
        XCTAssertEqual(starkHouse.count, 0)
        starkHouse.add(person:robb)
        
        XCTAssertEqual(starkHouse.count, 1)
        starkHouse.add(person:arya)
        
        XCTAssertEqual(starkHouse.count, 2)
        
        //Esto no debería agregarlo, entonces chequeamos que el count siga siendo 2 para saber que no lo agrega
        starkHouse.add(person:tyrion)
        XCTAssertEqual(starkHouse.count, 2)
        
    }
    
    func testHouseEquality() {
        
        //Identidad
        XCTAssertEqual(starkHouse, starkHouse)
        
        //Igualdad
        let jinxed = House(name: "Stark", sigil: starkSigil, words: "Winter is coming")
        XCTAssertEqual(jinxed, starkHouse)
        
        //Desigualdad
        XCTAssertNotEqual(starkHouse, lannisterHouse)
    }
    
    func testHashable() {
        
        XCTAssertNotNil(starkHouse.hashValue)
    }

    func testHouseComparison() {
        
        //Comparar las casas, tengo que implementar porque las quiero comparar
        XCTAssertLessThan(lannisterHouse, starkHouse)
    }
}
