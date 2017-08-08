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

// Protocolos de Season

extension Season {
    var proxy : String {
        return "\(name) \(releaseDate)"
    }
    
    var proxyForComparison : String {
        
        get {
            return name.uppercased()
        }
    }
}

extension Season: Equatable {
    
    static func ==(lhs: Season, rhs: Season) -> Bool {
        return lhs.proxy == rhs.proxy
    }
}

extension Season: Hashable {
    
    var hashValue: Int {
        
        get{
            return proxy.hashValue
        }
    }
}

extension Season: Comparable {
    
    static func <(lhs: Season, rhs: Season) -> Bool {
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
}

extension Season: CustomStringConvertible {
    
    var description: String {
        return "\(name) - \(releaseDate)"
    }
}
