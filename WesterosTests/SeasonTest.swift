//
//  SeasonTest.swift
//  Westeros
//
//  Created by Bamby on 31/8/17.
//  Copyright © 2017 eureka apps. All rights reserved.
//

import XCTest
@testable import Westeros

class SeasonTest: XCTestCase {
    
    var season : Season!
    var season2 : Season!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        season = Season(name: "season 1", episodesNumber: 5, releaseDate: Date())
        season2 = Season(name: "season", episodesNumber: 2, releaseDate: Date())
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
    
    func testPersonExistence(){
        XCTAssertNotNil(season)
    }
    
    func testFullName(){
        XCTAssertEqual(season.name, "season 1")
    }
    
    func testSeasonEquality(){
        // Identidad
        XCTAssertEqual(season, season)
        
        // Igualdad
//        let imp = Person(name: "Tyrion", alias: "The Imp", house: lannisterHouse)
        let testSeason = Season(name: "season 1", episodesNumber: 5, releaseDate: Date())
        XCTAssertEqual(testSeason, season)
        
//        // Desigualdad
//        XCTAssertNotEqual(season, season2)
    }
}
