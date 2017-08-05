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
    
    init (title: String, screeningDate: Date) {
        self.title = title
        self.screeningDate = screeningDate
    }
}
