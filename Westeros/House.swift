//
//  House.swift
//  Westeros
//
//  Created by Tomás Ignacio Moyano on 7/6/17.
//  Copyright © 2017 Tomás Ignacio Moyano. All rights reserved.
//

import UIKit

typealias Words = String
//Uso el typealias, porque de momento quiero un set, si necesito array en el futuro, puedo simplemente cambiarlo aca y funciona en todo el código
//Como es un Set the Person, person tiene que implementar hashable para que el set pueda comparar que las personas son únicas en el set
typealias Members = Set<Person>

final class House {
    
    let name : String
    let sigil : Sigil
    let words : Words
    private var _members : Members
    
    init (name: String, sigil: Sigil, words: Words) {
        
        (self.name, self.sigil, self.words) = (name, sigil, words)
        _members = Members()
    }
}

//Emblema
final class Sigil {
    
    let description : String
    let image       : UIImage
    
    init (description: String, image: UIImage) {
        
        (self.description, self.image) = (description, image)
    }
}

extension House {
    
    var count : Int {
        return _members.count
    }
    
    func add(person:Person) {
        //Validamos que la persona que se agrega corresponda a esta casa, sino retorno y no lo agrego
        guard person.house == self else {
            return
        }
        //Implementar equatable para poder comparar houses
        
        _members.insert(person)
    }
}

extension House {
    var proxy : String {
        return "\(name)  \(sigil.description)  \(words)"
    }
    
    var proxyForComparison : String {
        
        get {
            return name.uppercased()
        }
    }
}

//Protocolos De House
extension House : Hashable {
    
    var hashValue : Int {
        
        get{
            return proxy.hashValue
        }
    }
}

extension House : Equatable {
    
    static func ==(lhs: House, rhs: House) -> Bool {
        return lhs.proxy == rhs.proxy
    }
}

//Comparable

extension House : Comparable {
    
    static func <(lhs: House, rhs: House) -> Bool {
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
    
}
