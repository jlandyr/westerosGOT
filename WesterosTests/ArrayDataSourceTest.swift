//
//  ArrayDataSourceTest.swift
//  Westeros
//
//  Created by Bamby on 20/7/17.
//  Copyright © 2017 eureka apps. All rights reserved.
//

import XCTest
@testable import Westeros
class ArrayDataSourceTest: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
//    func testArrayDataSourceCreation(){
//        
//        let ds = ArrayDataSource(model: [1,2,3,4]) { (number: Int, tableView: UITableView) -> UITableViewCell in
//            
//            let cellID = "NumberCell"
//            var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
//            if cell == nil{
//                cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
//            }
//            
//            cell?.textLabel?.text = "El número \(number)"
//            return cell!
//        }
//        
//        XCTAssertNotNil(ds)
//    }
}
