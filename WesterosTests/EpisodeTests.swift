//
//  EpisodeTests.swift
//  Westeros
//
//  Created by Tomás Ignacio Moyano on 8/6/17.
//  Copyright © 2017 Tomás Ignacio Moyano. All rights reserved.
//

import XCTest

@testable import Westeros

class EpisodeTests: XCTestCase {
    
    var episodes: [Episode] = []
    
    override func setUp() {
        super.setUp()

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        
        let s1ep1Date:Date = formatter.date(from: "2011/04/17")!
        let s1ep2Date:Date = formatter.date(from: "2011/04/24")!
        
        let s1ep1 = Episode(title: "Winter is Coming", screeningDate: s1ep1Date)
        let s1ep2: Episode = Episode(title: "The Kingsroad", screeningDate: s1ep2Date)
        
        episodes = [s1ep1, s1ep2]
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testEpisodeEquality() {
        
        //Identidad
        XCTAssertEqual(episodes[1], episodes[1])
        
        //Igualdad
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        
        let s1ep1Date:Date = formatter.date(from: "2011/04/17")!
        let s1ep1 = Episode(title: "Winter is Coming", screeningDate: s1ep1Date)

        XCTAssertEqual(s1ep1, episodes[0])
        
        //Desigualdad
        XCTAssertNotEqual(episodes[0], episodes[1])
    }
    
    func testHashable() {
        
        XCTAssertNotNil(episodes[0].hashValue)
    }
    
    func testEpisodeComparison() {
        
        //Comparar los episodios por fecha
        XCTAssertLessThan(episodes[0], episodes[1])
    }
    
    func testEpisodeCustomStringConvertible() {
        //Testeo que se pueda obtener un string al printear un episodio
        XCTAssertNotNil(episodes[0].description)
    }
}
