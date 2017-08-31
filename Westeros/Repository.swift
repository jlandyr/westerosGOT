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
    var seasons: [Season] {get}
    func season(named:String) -> Season?
}

final class LocalFactory:HouseFactory{
    
    func houses(filteredBy: Filter) -> [House]{
        let filtered = Repository.local.houses.filter(filteredBy)
        return filtered
    }
    
    func seasons(filteredBy:(Season)-> Bool) -> [Season]{
        return Repository.local.seasons.filter(filteredBy)
    }
    
    var seasons: [Season]{
        get {
            let season1 = Season(name: "name season 1", episodesNumber: 0, releaseDate: Date())
            let season2 = Season(name: "name season 2", episodesNumber: 0, releaseDate: Date())
            let season3 = Season(name: "name season 3", episodesNumber: 0, releaseDate: Date())
            let season4 = Season(name: "name season 4", episodesNumber: 0, releaseDate: Date())
            
            season1.add(episode: Episode(title: "episode 1, season 1", broadcastDate: Date(), season: season1))
            season1.add(episode: Episode(title: "episode 2, season 1", broadcastDate: Date(), season: season1))
            season1.add(episode: Episode(title: "episode 3, season 1", broadcastDate: Date(), season: season1))
            season1.add(episode: Episode(title: "episode 4, season 1", broadcastDate: Date(), season: season1))
            
            season2.add(episode: Episode(title: "episode 1, season 2", broadcastDate: Date(), season: season2))
            season2.add(episode: Episode(title: "episode 2, season 2", broadcastDate: Date(), season: season2))
            season2.add(episode: Episode(title: "episode 3, season 2", broadcastDate: Date(), season: season2))
            
            season3.add(episode: Episode(title: "episode 1, season 3", broadcastDate: Date(), season: season3))
            season3.add(episode: Episode(title: "episode 2, season 3", broadcastDate: Date(), season: season3))
            season3.add(episode: Episode(title: "episode 3, season 3", broadcastDate: Date(), season: season3))
            season3.add(episode: Episode(title: "episode 4, season 3", broadcastDate: Date(), season: season3))
            season3.add(episode: Episode(title: "episode 5, season 3", broadcastDate: Date(), season: season3))
            
            season4.add(episode: Episode(title: "episode 1, season 4", broadcastDate: Date(), season: season4))
            season4.add(episode: Episode(title: "episode 2, season 4", broadcastDate: Date(), season: season4))
            season4.add(episode: Episode(title: "episode 3, season 4", broadcastDate: Date(), season: season4))
            season4.add(episode: Episode(title: "episode 4, season 4", broadcastDate: Date(), season: season4))
            season4.add(episode: Episode(title: "episode 5, season 4", broadcastDate: Date(), season: season4))
            season4.add(episode: Episode(title: "episode 6, season 4", broadcastDate: Date(), season: season4))
            
            return Array([season1,season2, season3, season4].sorted().prefix(6))
//            return [season1,season2, season3, season4].sorted()
        }
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
    
    func season(named:String) -> Season?{
        let season = seasons.filter{$0.name.uppercased() == named.uppercased()}.first
        return season
    }
}

