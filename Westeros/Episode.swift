//
//  Episode.swift
//  Westeros
//
//  Created by Tomás Ignacio Moyano on 8/5/17.
//  Copyright © 2017 Tomás Ignacio Moyano. All rights reserved.
//

import Foundation

final class Episode {
    
    let title : String
    let screeningDate : Date
    weak var season: Season?
    
    init (title: String, screeningDate: Date) {
        self.title = title
        self.screeningDate = screeningDate
    }
}

// Protocolos de Episode

extension Episode {
    var proxy : String {
        return "\(title) \(screeningDate)"
    }
    
    var proxyForComparison : String {
        
        get {
            return String(screeningDate.timeIntervalSince1970)
        }
    }
}

extension Episode: Equatable {
    
    static func ==(lhs: Episode, rhs: Episode) -> Bool {
        return lhs.proxy == rhs.proxy
    }
}

extension Episode: Hashable {
    
    var hashValue: Int {
        
        get {
            return proxy.hashValue
        }
    }
    
}

extension Episode: Comparable {
    
    static func <(lhs: Episode, rhs: Episode) -> Bool {
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
}

extension Episode: CustomStringConvertible {
    
    var description: String {
        return title
    }
}
