//
//  WesterosTests.swift
//  WesterosTests
//
//  Created by Bamby on 5/7/17.
//  Copyright © 2017 eureka apps. All rights reserved.
//

import XCTest
@testable import Westeros

class WesterosTests: XCTestCase {
    
    var starkImage: UIImage!
    var lannisterImage: UIImage!
    
    var starkSigil : Sigil!
    var lannisterSigil: Sigil!

    var starkHouse : House!
    var lannisterHouse : House!
    
    var robb: Person!
    var arya: Person!
    var tyrion: Person!
    
    let starkURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")!
    let lannisterURL = URL(string:"https://awoiaf.westeros.org/index.php/House_Lannister")!
    let targaryenURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Targaryen")!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        starkImage = #imageLiteral(resourceName: "lannister.jpg")
        lannisterImage = #imageLiteral(resourceName: "lannister.jpg")
        
        starkSigil = Sigil(description: "Direwolf", image: starkImage)
        lannisterSigil = Sigil(description: "Rampant Lion", image: #imageLiteral(resourceName: "lannister.jpg"))
        
        starkHouse = House(name: "Stark", sigil: starkSigil, words: "Winter is coming!", url: starkURL)
        lannisterHouse = House(name: "Lannister", sigil: lannisterSigil, words: "Hear me roar!", url: lannisterURL)
        
        robb = Person(name: "Robb", alias: "The young wolf", house: starkHouse)
        arya = Person(name: "Arya", house: starkHouse)
        tyrion = Person(name: "Tyrion", alias: "The Imp", house: lannisterHouse)
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testHouseExistence(){
        let starkSigil = Sigil(description: "Direwolf", image: #imageLiteral(resourceName: "codeIsComing.png"))
        let stark = House(name: "Stark", sigil: starkSigil, words: "Winter is coming!", url: starkURL)
        XCTAssertNotNil(stark)
    }
    
    func testSigilExistence(){
        let starkSigil = Sigil(description: "Direwolf", image: #imageLiteral(resourceName: "codeIsComing.png"))
        XCTAssertNotNil(starkSigil)
        
        let lannisterSigil = Sigil(description: "Rampant Lion", image: #imageLiteral(resourceName: "lannister.jpg"))
        
        XCTAssertNotNil(lannisterSigil)
    }
    
    func testAddPersons(){
        
        XCTAssertEqual(starkHouse.count, 0)
        starkHouse.add(person: robb)
        
        XCTAssertEqual(starkHouse.count, 1)
        starkHouse.add(person: arya)
        
        XCTAssertEqual(starkHouse.count, 2)
        
        starkHouse.add(person: tyrion)
        XCTAssertEqual(starkHouse.count, 2)
        
    }
    
    func testHouseEquality(){
        //identidad
        XCTAssertEqual(starkHouse, starkHouse)
        //igualdad
        let jinxed = House(name: "Stark!", sigil: starkSigil, words: "Winter is coming!", url: starkURL)
        XCTAssertEqual(jinxed, starkHouse)
        //desigualdad
//        XCTAssertNotEqual(starkHouse, lannisterHouse)
    }
    
    func testHashable() {
        XCTAssertNotNil(starkHouse.hashValue)
        
    }
    
    func testHouseComparison(){
        //PARA XCTAssertLessThan tenemos que implementar en House.swift el método Comparable
        XCTAssertLessThan(lannisterHouse, starkHouse)
    }
}
