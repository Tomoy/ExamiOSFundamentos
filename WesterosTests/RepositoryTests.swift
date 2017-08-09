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
    
    var localHouses : [House]!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        localHouses = Repository.local.houses
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
        XCTAssertEqual(houses.count, 3)
    }
    
    func testLocalRepositoryReturnsSortedArrayOfHouses() {
        XCTAssertEqual(localHouses, localHouses.sorted())
    }
    
    func testLocalRespoReturnsHousesByNameCaseInsensitively() {
        
        let stark = Repository.local.house(named: "sTark")
        XCTAssertEqual(stark?.name, "Stark")
        
        //Esta casa no debería existir
        let grijander = Repository.local.house(named: "Grijander")
        XCTAssertNil(grijander)
    }
    
    func testHouseFiltering() {
        let filtered = Repository.local.houses(filteredBy: {$0.count == 1})
        XCTAssertEqual(filtered.count, 1)
    }
    
    func testSeasonFiltering() {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let year2015:Date = formatter.date(from: "2015/01/01")!
        
        //Filtro las nuevas temporadas desde el 2015, deberían ser 3 (2015, 2016 y 2017)
        let filteredSeasons = Repository.local.seasons(filteredBy: {$0.releaseDate.timeIntervalSince1970 > year2015.timeIntervalSince1970})
        XCTAssertEqual(filteredSeasons.count, 3)
    }
}
