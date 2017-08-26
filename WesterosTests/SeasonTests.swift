//
//  SeasonTests.swift
//  Westeros
//
//  Created by Tomás Ignacio Moyano on 8/6/17.
//  Copyright © 2017 Tomás Ignacio Moyano. All rights reserved.
//

import XCTest

@testable import Westeros

class SeasonTests: XCTestCase {
    
    var seasons: [Season] = []
    
    override func setUp() {
        super.setUp()
        seasons = Repository.local.seasons
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testEpisodesExistance() {
        
        for season:Season in seasons {
            XCTAssertTrue(season.episodes.count > 0)
            
            //Chequeo que todas las seasons de los episodios fueron bien asignadas
            for episode:Episode in season.episodes {
                XCTAssertEqual(episode.season, season)
            }
        }
    }
    
    func testSeasonEquality() {
        
        //Identidad
        XCTAssertEqual(seasons[3], seasons[3])
        
        //Igualdad
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        
        let s5ep1Date:Date = formatter.date(from: "2015/04/12")!
        let s5ep2Date:Date = formatter.date(from: "2015/04/19")!
        
        let s5ep1 = Episode(title: "The Wars to Come", screeningDate: s5ep1Date)
        let s5ep2: Episode = Episode(title: "The House of Black and White", screeningDate: s5ep2Date)
        
        let season5 = Season(episodes: [s5ep1, s5ep2], name: "Season 5", releaseDate: s5ep1Date)
        XCTAssertEqual(season5, seasons[4])
        
        //Desigualdad
        XCTAssertNotEqual(seasons[2], seasons[6])
    }
    
    func testHashable() {
        
        XCTAssertNotNil(seasons[0].hashValue)
    }
    
    func testSeasonComparison() {
        
        //Comparar las seasons
        XCTAssertLessThan(seasons[2], seasons[4])
    }
    
    func testSeasonCustomStringConvertible() {
        //Testeo que se pueda obtener un string al printear una season
        XCTAssertNotNil(seasons[0].description)
    }
    
}
