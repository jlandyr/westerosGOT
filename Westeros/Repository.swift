//
//  Repository.swift
//  Westeros
//
//  Created by Bamby on 19/7/17.
//  Copyright © 2017 eureka apps. All rights reserved.
//

import Foundation

final class Repository{
    
    static let local = LocalFactory()
    
}
protocol HouseFactory {
    typealias Filter = (House)-> Bool
    var houses: [House] {get}
    func house(named:String)->House?
    func houses(filteredBy:Filter) -> [House]
    
}

final class LocalFactory:HouseFactory{
    
    func houses(filteredBy: Filter) -> [House]{
        let filtered = Repository.local.houses.filter(filteredBy)
        return filtered
    }
    
    var houses: [House]{
        get {
            //aquí crea las casas
            let starkSigil = Sigil(description: "Direwolf", image: #imageLiteral(resourceName: "codeIsComing.png"))
            let lannisterSigil = Sigil(description: "Rampant", image: #imageLiteral(resourceName: "lannister.jpg"))
            let targaryenSigil = Sigil(description: "Three head dragón", image: #imageLiteral(resourceName: "targaryenSmall.jpg"))
            
            let starkURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")!
            let lannisterURL = URL(string:"https://awoiaf.westeros.org/index.php/House_Lannister")!
            let targaryenURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Targaryen")!
            
            let stark = House(name: "Stark", sigil: starkSigil, words: "Winter is coming", url: starkURL)
            let lanister = House(name: "Lannister", sigil: lannisterSigil, words: "Hear me roar!", url: lannisterURL)
            let targaryen = House(name: "Targaryen", sigil: targaryenSigil, words: "Fire & Blood", url: targaryenURL)
            
            let robb = Person(name: "Robb", alias: "The young wolf", house: stark)
            let arya = Person(name: "Arya", house: stark)
            let tyrion = Person(name: "Tyrion", alias: "The imp", house: lanister)
            let jaime = Person(name: "Jaime", alias: "Kingslayer", house: lanister)
            let cersei = Person(name: "Cersei", house: lanister)
            let dani = Person(name: "Daenerys", alias: "Mother of dragons", house: targaryen)
            
            //añadir los personajes a las casas
            stark.add(persons: robb,arya)
            lanister.add(persons: cersei, jaime,tyrion)
            targaryen.add(person: dani)
            return [stark,lanister,targaryen].sorted()
        }
    }
    
    func house(named:String) -> House? {
        let house = houses.filter{$0.name.uppercased() == named.uppercased()}.first
        return house
    }
}

