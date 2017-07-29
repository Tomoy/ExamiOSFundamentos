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
    
    var starkSigil : Sigil!
    var lannisterSigil : Sigil!
    
    var starkHouse : House!
    var lannisterHouse : House!
    
    var robb   : Person!
    var arya   : Person!
    var tyrion : Person!
    
    override func setUp() {
        super.setUp()
        
        //let houses = Repository.local.houses
        let starkImage = #imageLiteral(resourceName: "stark.png")
        let starkWikiURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")!
        starkSigil = Sigil(description: "Direwolf", image: starkImage)
        starkHouse = House(name: "Stark", sigil: starkSigil, words: "Winter is coming", url: starkWikiURL)
        
        let lannisterImg = #imageLiteral(resourceName: "lannister.jpg")
        let lannisterWikiURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Lannister")!
        lannisterSigil = Sigil(description: "Rampant", image: lannisterImg)
        lannisterHouse = House(name: "Lannister", sigil: lannisterSigil, words: "Hear me roar!", url: lannisterWikiURL)
        
        robb = Person(name: "Robb", alias: "The young wolf", house: starkHouse)
        arya = Person(name: "Arya", house: starkHouse)
        
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
        let starkWikiURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")!
        let jinxed = House(name: "Stark", sigil: starkSigil, words: "Winter is coming", url: starkWikiURL)
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
