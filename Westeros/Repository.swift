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

protocol SeasonFactory {
    
    typealias Filter = (Season)->Bool
    
    var seasons: [Season] {get}
    func seasons(filteredBy: Filter) -> [Season]
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
final class LocalFactory : HouseFactory, SeasonFactory {
    
    func seasons(filteredBy: (Season) -> Bool) -> [Season] {
        let filtered = Repository.local.seasons.filter(filteredBy)
        return filtered
    }

    var seasons: [Season] {
        
        get {
            
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy/MM/dd"
           
            let s1ep1Date:Date = formatter.date(from: "2011/04/17")!
            let s1ep2Date:Date = formatter.date(from: "2011/04/24")!
            
            let s1ep1 = Episode(title: "Winter is Coming", screeningDate: s1ep1Date)
            let s1ep2: Episode = Episode(title: "The Kingsroad", screeningDate: s1ep2Date)

            let season1 = Season(episodes: [s1ep1, s1ep2], name: "Season 1", releaseDate: s1ep1Date)
            s1ep1.season = season1
            s1ep2.season = season1
            
            let s2ep1Date:Date = formatter.date(from: "2012/04/01")!
            let s2ep2Date:Date = formatter.date(from: "2012/04/08")!
            
            let s2ep1 = Episode(title: "The north Remembers", screeningDate: s2ep1Date)
            let s2ep2: Episode = Episode(title: "The night Lands", screeningDate: s2ep2Date)
            
            let season2 = Season(episodes: [s2ep1, s2ep2], name: "Season 2", releaseDate: s2ep1Date)
            s2ep1.season = season2
            s2ep2.season = season2
            
            let s3ep1Date:Date = formatter.date(from: "2013/03/31")!
            let s3ep2Date:Date = formatter.date(from: "2013/04/07")!
            
            let s3ep1 = Episode(title: "Valar Dohaeris", screeningDate: s3ep1Date)
            let s3ep2: Episode = Episode(title: "Dark Wings, Dark Words", screeningDate: s3ep2Date)
            
            let season3 = Season(episodes: [s3ep1, s3ep2], name: "Season 3", releaseDate: s3ep1Date)
            s3ep1.season = season3
            s3ep2.season = season3
            
            let s4ep1Date:Date = formatter.date(from: "2014/04/06")!
            let s4ep2Date:Date = formatter.date(from: "2014/04/13")!
            
            let s4ep1 = Episode(title: "Two Swords", screeningDate: s4ep1Date)
            let s4ep2: Episode = Episode(title: "The Lion and the Rose", screeningDate: s4ep2Date)
            
            let season4 = Season(episodes: [s4ep1, s4ep2], name: "Season 4", releaseDate: s4ep1Date)
            s4ep1.season = season4
            s4ep2.season = season4
            
            let s5ep1Date:Date = formatter.date(from: "2015/04/12")!
            let s5ep2Date:Date = formatter.date(from: "2015/04/19")!
            
            let s5ep1 = Episode(title: "The Wars to Come", screeningDate: s5ep1Date)
            let s5ep2: Episode = Episode(title: "The House of Black and White", screeningDate: s5ep2Date)
            
            let season5 = Season(episodes: [s5ep1, s5ep2], name: "Season 5", releaseDate: s5ep1Date)
            s5ep1.season = season5
            s5ep2.season = season5
            
            let s6ep1Date:Date = formatter.date(from: "2016/04/24")!
            let s6ep2Date:Date = formatter.date(from: "2016/05/01")!
            
            let s6ep1 = Episode(title: "The Red Woman", screeningDate: s6ep1Date)
            let s6ep2: Episode = Episode(title: "Home", screeningDate: s6ep2Date)
            
            let season6 = Season(episodes: [s6ep1, s6ep2], name: "Season 6", releaseDate: s6ep1Date)
            s6ep1.season = season6
            s6ep2.season = season6
            
            let s7ep1Date:Date = formatter.date(from: "2017/07/16")!
            let s7ep2Date:Date = formatter.date(from: "2017/07/23")!
            
            let s7ep1 = Episode(title: "Dragonstone", screeningDate: s7ep1Date)
            let s7ep2: Episode = Episode(title: "Stormborn", screeningDate: s7ep2Date)
            
            let season7 = Season(episodes: [s7ep1, s7ep2], name: "Season 7", releaseDate: s7ep1Date)
            s7ep1.season = season7
            s7ep2.season = season7
            
            return [season1, season2, season3, season4, season5, season6, season7].sorted()
        }
    }
    
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
