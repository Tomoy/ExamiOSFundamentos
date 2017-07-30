//
//  ArrayDataSourceTest.swift
//  Westeros
//
//  Created by Tomás Ignacio Moyano on 7/29/17.
//  Copyright © 2017 Tomás Ignacio Moyano. All rights reserved.
//

import XCTest
@testable import Westeros

class ArrayDataSourceTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testArrayDataSourceCreation() {
        
        let dataSource = ArrayDataSource(model: [1,2,3,4]) { (number: Int, tableView: UITableView) -> UITableViewCell in
            
            let cellId = "NumberCell"
            var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
            
            if (cell == nil) {
                cell = UITableViewCell(style: .default, reuseIdentifier: cellId)
            }
            
            cell?.textLabel?.text = "El número \(number)"
            
            return cell!
        }
        
        XCTAssertNotNil(dataSource)
    }
}
