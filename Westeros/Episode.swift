//
//  Episode.swift
//  Westeros
//
//  Created by Bamby on 31/8/17.
//  Copyright © 2017 eureka apps. All rights reserved.
//

import Foundation

final class Episode {
    let title: String
    let broadcastDate: Date
    weak var season: Season?
    
    init(title:String, broadcastDate:Date, season:Season?) {
        self.title = title
        self.broadcastDate = broadcastDate
        self.season = season
    }
}
extension Episode{
    var proxy : String{
        get{
            return "\(title) \(season!.name) \(broadcastDate)"
//            return "\(title) \(season!.name)"
        }
    }
    
}
extension Episode:Equatable{
    static func == (lhs : Episode, rhs: Episode) ->  Bool {
        return true
    }
    
}
extension Episode:Hashable{
    var hashValue: Int {
        return proxy.hashValue
    }
}
extension Episode : Comparable{
    static func <(lhs: Episode, rhs: Episode) -> Bool {
        return lhs.proxy < rhs.proxy
    }
    
    
    
}
