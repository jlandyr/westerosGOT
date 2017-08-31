//
//  Season.swift
//  Westeros
//
//  Created by Bamby on 31/8/17.
//  Copyright © 2017 eureka apps. All rights reserved.
//

import Foundation

typealias Episodes = Set<Episode>

final class Season{

    let name : String
    var episodesNumber: Int? {
        didSet {
            if episodesNumber == 0  {
                episodesNumber = self.count
            }
        }
    }
    
    let releaseDate: Date
    var _episodes : Episodes
    
    
    init(name:String, episodesNumber:Int, releaseDate: Date) {
        self.name = name
        self.episodesNumber = episodesNumber
        self.releaseDate = releaseDate
        _episodes = Episodes()
    }
    
    func sortSeason() -> [Episode]{
        return Array(_episodes.sorted().prefix(2))
    }
    func sortedSeason() -> [Episode]{
        return _episodes.sorted()
    }
}
extension Season{
    var proxyForEquality : String{
        get{
            return "\(name) \(releaseDate) \(count)"
        }
    }
    var proxyForComparison : String{
        get{
            return name.uppercased()
//            return "\(name) \(episodesNumber ?? 0) \(count)"
        }
    }
    var count : Int{
        return _episodes.count
    }
    
    func add(episode: Episode){
        
        guard episode.season?.name == self.name else {
            return
        }
        _episodes.insert(episode)
    }
}
extension Season:Equatable{
    static func == (lhs : Season, rhs: Season) ->  Bool {
        return true
    }
}
extension Season:Hashable{
    var hashValue: Int {
        return proxyForEquality.hashValue
    }
}
extension Season : Comparable{
    static func <(lhs: Season, rhs: Season) -> Bool {
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
    
    
    
}
