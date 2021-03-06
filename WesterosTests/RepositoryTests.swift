//
//  RepositoryTests.swift
//  Westeros
//
//  Created by Bamby on 19/7/17.
//  Copyright © 2017 eureka apps. All rights reserved.
//

import XCTest
@testable import Westeros

class RepositoryTests: XCTestCase {
    
    var localHouses : [House]!
    var localSeasons : [Season]!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        localHouses = Repository.local.houses
        localSeasons = Repository.local.seasons
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLocalRepositoryCreation() {
        XCTAssertNotNil(Repository.local)
    }
    
    func testLocalRepositoryHousesCreation() {
        let houses = Repository.local.houses
        XCTAssertNotNil(houses)
        XCTAssertEqual(houses.count, 3)//3
        
        
    }
    
    func testLocalRepositorySeasonsCreation(){
        let seasons = Repository.local.seasons
        XCTAssertNotNil(seasons)
        XCTAssertEqual(seasons.count, 4)//4
    }
    
    //test para comprobar que ordene el arreglo Houses
    func testLocalRepositoryReturnSortedArrayOfHouses() {
        XCTAssertEqual(localHouses, localHouses.sorted())
        
    }
    
    func testLocalRepositoryReturnSortedArrayOfSeasons(){
        XCTAssertEqual(localSeasons, localSeasons.sorted())
    }
    
    func testLocalRepoReturnsHousesByNameCaseInsentivie() {
        let stark = Repository.local.house(named: "sTaRk")
        XCTAssertEqual(stark?.name, "Stark")
        
        
    }
    
    func testLocalRepoReturnsSeasonsByNameCaseInsentivie() {
        let season = Repository.local.season(named: "name SEason 4")
        XCTAssertEqual(season?.name, "name season 4")
    }
    
    //test
//    func testHouseFiltering(){
//        let filtered = Repository.local.houses(filteredBy: {$0.count == 1})
//        XCTAssertEqual(filtered.count, 1)
//    }
    
}
