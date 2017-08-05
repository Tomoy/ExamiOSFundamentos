//
//  Season.swift
//  Westeros
//
//  Created by Tomás Ignacio Moyano on 8/5/17.
//  Copyright © 2017 Tomás Ignacio Moyano. All rights reserved.
//

import UIKit

final class Season {
    
    let episodes    : [Episode]
    let name        : String
    let releaseDate : Date
    
    init (episodes: [Episode], name: String, releaseDate: Date) {
        self.episodes = episodes
        self.name = name
        self.releaseDate = releaseDate
    }
}
