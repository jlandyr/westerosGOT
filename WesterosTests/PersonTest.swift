//
//  CharacterTest.swift
//  Westeros
//
//  Created by Bamby on 6/7/17.
//  Copyright © 2017 eureka apps. All rights reserved.
//

import XCTest
@testable import Westeros

class CharacterTest: XCTestCase {
    
    var starkHouse : House?
    var starSigil : Sigil!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        starSigil = Sigil(description: "", image: #imageLiteral(resourceName: <#T##String#>))
        starkHouse = House(name: "", sigil: starSigil, words: "")
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
    
    func testCharExistence(){
        let ned = Westeros.Character(name:"", alias:"", house:starkHouse)
        XCTAssertNotNil(ned)
    }
    
}
