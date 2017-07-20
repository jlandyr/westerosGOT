//
//  House.swift
//  Westeros
//
//  Created by Bamby on 6/7/17.
//  Copyright © 2017 eureka apps. All rights reserved.
//

import Foundation
import UIKit

//typealias Sigil = String
typealias Words = String
typealias Members = Set<Person>

final class House{
    let name: String
    let sigil: Sigil
    let words: Words
    let wiki:URL
    var _members : Members
    
    init(name:String, sigil:Sigil, words:Words, url:URL) {
        (self.name, self.sigil, self.words, self.wiki) = (name,sigil,words,url)
        _members = Members()
    }
    
//    var count : Int {
//        return _members.count
//    }
//    
//    func add(person:Person){
//        guard person.house.name == self.name else {
//            return
//        }
//        _members.insert(person)
//    }
}

final class Sigil{
    let description :String
    let image: UIImage
    
    init(description:String, image:UIImage) {
        (self.description, self.image) = (description,image)
    }
}

extension House{
    var count : Int{
        return _members.count
    }
    
    func add(person: Person){
        
        guard person.house.name == self.name else {
            return
        }
        _members.insert(person)
    }
    
    //Person... es una función variádica (puede recibir varios parámetros)
    func add(persons:Person...){
        for person in persons{
            add(person: person)
        }
    }
    
    //Sorted [Person]
    func sortedMembers() -> [Person]{
        return _members.sorted()
//        let memberArray : [Person] = Array(_members)
//        return memberArray.sorted()
    }
}
extension House{
    var proxyForEquality : String{
        get{
            return "\(name) \(words) \(count)"
        }
    }
    
    var proxyForComparison : String{
        get{
            return name.uppercased()
        }
    }
}
extension House:Equatable{
    static func == (lhs : House, rhs: House) ->  Bool {
            return true
    }
}

// MARK: - Hashable
extension House : Hashable{
    var hashValue: Int {
        return proxyForEquality.hashValue
    }
}

// MARK: - Comparable
extension House : Comparable{
    static func <(lhs: House, rhs: House) -> Bool {
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
    
    
    
}
