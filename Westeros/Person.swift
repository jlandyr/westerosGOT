//
//  Character.swift
//  Westeros
//
//  Created by Bamby on 6/7/17.
//  Copyright © 2017 eureka apps. All rights reserved.
//

import Foundation

final class Person{
    let name : String
    let house: House
    private let _alias: String?
    //private: la variable es visible solo dentro de la class
    
    
    //creamos una var alias y en su get comprobamos que si _alias es optional retornamos "", caso contrario regresamos su valor
    var alias:String{
        get{
//            if let _theAlias = _alias{
//                //si existe _alias
//                return _theAlias
//            }else{
//                return ""
//            }
            
            return _alias ?? ""
        }
    }
    
    //como alias es optional, swift permite crear los inicializadores que nos convengan
    init(name:String, alias:String?, house:House) {
        (self.name, _alias ,self.house) = (name,alias,house)
    }
    
    convenience init(name:String, house:House) {
        self.init(name: name, alias: nil, house: house)
    }
}

extension Person{
    var fullName : String{
        return "\(name) \(house.name)"
    }
}
extension Person{
    var proxy : String{
        return "\(name) \(alias) \(house.name)"
    }
}
extension Person:Hashable {
    var hashValue : Int{
        get {
            return proxy.hashValue
            
        }
    }
}
extension Person:Equatable{
    static func == (lhs: Person, rhs:Person) -> Bool{
        return lhs.proxy == rhs.proxy
    }
}
extension Person : Comparable{
    static func <(lhs: Person, rhs: Person) -> Bool {
        return lhs.proxy < rhs.proxy
    }
    
    
    
}
