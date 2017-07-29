//
//  Repository.swift
//  Westeros
//
//  Created by Tomás Ignacio Moyano on 7/11/17.
//  Copyright © 2017 Tomás Ignacio Moyano. All rights reserved.
//

import UIKit

//Repositorio para concentrar toda la creación de los modelos en un sitio

final class Repository {
    
    static let local = LocalFactory()
}

//Cualquier clase que implemente este protcolo (para crear casas), me tiene que devolver una lista de casas,
//que es lo que quiero para la propiedad local del repositorio, entonces lo puedo usar para LocalFactory y RemoteFactory
protocol HouseFactory {
    
    //Filter es una funcion que recibe un solo parametro (house) que devuelve un booleano
    typealias Filter = (House)->Bool
    
    var houses : [House] {get}
    func house(named: String) -> House?
    func houses(filteredBy: Filter) -> [House]
}

//Usamos el protocolo para que cuando queramos cambiarlo a remotefactory, podemos implementar el mismo HouseFactory protocol
final class LocalFactory : HouseFactory {
    
    func houses(filteredBy: (House) -> Bool) -> [House] {
        let filtered = Repository.local.houses.filter(filteredBy)
        return filtered
    }

    var houseSigils : [Sigil] {
        
        get {
            
            let starkImage = #imageLiteral(resourceName: "stark.png")
            let lannisterImage = #imageLiteral(resourceName: "lannister.jpg")
            
            let starkSigil = Sigil(description: "Direwolf", image: starkImage)
            let lannisterSigil = Sigil(description: "Rampant Lion", image: lannisterImage)
            
            return [starkSigil,lannisterSigil]
        }
    }
    
    var houses: [House] {
        
        get {
            //Creamos las houses
            
            // Stark House
            let starkImage = #imageLiteral(resourceName: "stark.png")
            let starkWikiURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")!
            let starkSigil = Sigil(description: "Direwolf", image: starkImage)
            let starkHouse = House(name: "Stark",
                                   sigil: starkSigil,
                                   words: "Winter is coming",
                                   url: starkWikiURL)
            
            // Lannister House
            let lannisterImg = #imageLiteral(resourceName: "lannister.jpg")
            let lannisterWikiURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Lannister")!
            let lannisterSigil = Sigil(description: "Rampant", image: lannisterImg)
            let lannisterHouse = House(name: "Lannister",
                                       sigil: lannisterSigil,
                                       words: "Hear me roar!",
                                       url: lannisterWikiURL)
            
            //Targaryen House
            let targaryenImage = #imageLiteral(resourceName: "targaryen.png")
            let targaryenWikiURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Targaryen")!
            let targaryenSigil = Sigil(description: "Three headed dragon", image: targaryenImage)
            let targaryenHouse = House(name: "Targaryen",
                                       sigil: targaryenSigil,
                                       words: "Fire & Blood",
                                       url: targaryenWikiURL)
            
            let robb = Person(name: "Robb", alias: "The young wolf", house: starkHouse)
            let arya = Person(name: "Arya", house: starkHouse)
            
            let tyrion = Person(name: "Tyrion", alias: "The Imp", house: lannisterHouse)
            let jamie = Person(name: "Jaime", alias: "Kingslayer", house: lannisterHouse)
            let cersei = Person(name: "Cersei", house: lannisterHouse)
            
            let dani = Person(name: "Daenerys", alias: "Mother of dragons", house: targaryenHouse)
            
            //Añadir los personajes a las casas
            starkHouse.add(persons: robb,arya)
            lannisterHouse.add(persons: tyrion, jamie, cersei)
            targaryenHouse.add(person: dani)
            
            return [starkHouse, lannisterHouse, targaryenHouse].sorted()
        }
    }
    
    func house(named: String) -> House? {
        
        let house = houses.filter{$0.name.uppercased() == named.uppercased()}.first
        return house
    }
}
