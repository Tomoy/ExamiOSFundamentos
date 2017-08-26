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
    
    var houses: [House] = []
    
    var starkHouse : House!
    var lannisterHouse : House!
    
    override func setUp() {
        super.setUp()
        
        houses = Repository.local.houses
        
        starkHouse = Repository.local.house(named: "Stark")
        lannisterHouse = Repository.local.house(named: "Lannister")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testHouseExistance() {
        
        XCTAssertNotNil(houses[1])
    }
    
    func testSigilExistance() {
        
        for house:House in houses {
            XCTAssertNotNil(house.sigil)
        }
    }
    
    func testAddPersons() {
        
        let sansa = Person(name: "Sansa", house: starkHouse)
        let bron = Person(name: "Bron", house: starkHouse)
        
        let tyrion = Person(name: "Tyrion", alias: "The Imp", house: lannisterHouse)
        
        XCTAssertEqual(starkHouse.count, 2)
        starkHouse.add(person:sansa)
        
        XCTAssertEqual(starkHouse.count, 3)
        starkHouse.add(person:bron)
        
        XCTAssertEqual(starkHouse.count, 4)
        
        //Esto no debería agregarlo, entonces chequeamos que el count siga siendo 2 para saber que no lo agrega
        starkHouse.add(person:tyrion)
        XCTAssertEqual(starkHouse.count, 4)
        
    }
    
    func testHouseEquality() {
        
        //Identidad
        XCTAssertEqual(houses[0], houses[0])
        
        //Igualdad
        let starkWikiURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")!
        let starkSigil = Sigil(description: "Direwolf", image: #imageLiteral(resourceName: "stark.png"))
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
