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
    
    var houses : [House] {get}
}

//Usamos el protocolo para que cuando queramos cambiarlo a remotefactory, podemos implementar el mismo HouseFactory protocol
final class LocalFactory : HouseFactory {
    
    var houses: [House] {
        
        get {
            //Creamos las houses
            
            // Stark House
            let starkImage = #imageLiteral(resourceName: "stark.png")
            let starkSigil = Sigil(description: "Direwolf", image: starkImage)
            let starkHouse = House(name: "Stark", sigil: starkSigil, words: "Winter is coming")
            
            // Lannister House
            let lannisterImg = #imageLiteral(resourceName: "lannister.jpg")
            let lannisterSigil = Sigil(description: "Rampant", image: lannisterImg)
            let lannisterHouse = House(name: "Lannister", sigil: lannisterSigil, words: "Hear me roar!")
            
            let robb = Person(name: "Robb", alias: "The young wolf", house: starkHouse)
            let arya = Person(name: "Arya", house: starkHouse)
            
            let tyrion = Person(name: "Tyrion", alias: "The Imp", house: lannisterHouse)
            let cersei = Person(name: "Cersei", house: lannisterHouse)
            
            //Añadir los personajes a las casas
            starkHouse.add(person: robb)
            starkHouse.add(person: arya)
            
            lannisterHouse.add(person: tyrion)
            lannisterHouse.add(person: cersei)
            
            return [starkHouse, lannisterHouse].sorted()
        }
    }
}
