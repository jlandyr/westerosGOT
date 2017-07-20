//
//  ArrayTableViewController.swift
//  Westeros
//
//  Created by Bamby on 20/7/17.
//  Copyright © 2017 eureka apps. All rights reserved.
//

import UIKit

class ArrayTableViewController<Element>: UITableViewController {

    let dataSource : ArrayDataSource<Element>
    let delegate: ArrayTableViewDelegate<Element>
    
    init(dataSource:ArrayDataSource<Element>,delegate: ArrayTableViewDelegate<Element>, title:String,style:UITableViewStyle) {
        self.dataSource = dataSource
        self.delegate = delegate
        super.init(style:style)
        self.title = title
        tableView.dataSource = self.dataSource
        tableView.delegate = self.delegate
        
        delegate.delegateOf(controller: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder): has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
