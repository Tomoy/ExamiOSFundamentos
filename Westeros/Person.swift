//
//  Character.swift
//  Westeros
//
//  Created by Tomás Ignacio Moyano on 7/6/17.
//  Copyright © 2017 Tomás Ignacio Moyano. All rights reserved.
//

import UIKit

final class Person {
    
    let name  : String
    let house : House
    private let _alias : String?

    
    var alias : String {
        
        get{
            //Si existe alias, lo retorno, sino retorno un string vacio
            return _alias ?? ""
        }
    }
    
    init(name: String, alias: String?, house: House) {
        
        self.name = name
        _alias = alias
        self.house = house
    }
    
//  Inicializador de conveniencia
    convenience init(name:String, house: House) {
        
        self.init(name: name, alias: nil, house: house)
    }
}

extension Person {
    
    var fullName : String {
        get {
            return "\(name) \(house.name)"
        }
    }
}

extension Person {
    var proxy : String {
        return "\(name)  \(alias)  \(house)"
    }
}

//Por convención se implementa el protocolo en una extension de la clase
extension Person : Hashable {
    
    var hashValue : Int {
        
        get{
            return proxy.hashValue
        }
    }
}

extension Person : Equatable {
    
    static func ==(lhs: Person, rhs: Person) -> Bool {
        return lhs.proxy == rhs.proxy
    }
}
