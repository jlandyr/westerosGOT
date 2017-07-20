//
//  MembersTableViewController.swift
//  Westeros
//
//  Created by Bamby on 20/7/17.
//  Copyright © 2017 eureka apps. All rights reserved.
//

import UIKit

class MembersTableViewController: UITableViewController {
    
    let model: [Person]
    init(model:[Person]) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder): has not been implemented")
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Members"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return model.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "MemberCell"
        let member = model[indexPath.row]
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        
        if cell == nil{
            cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
        }
        
        cell?.textLabel?.text = member.fullName
        return cell!
    }

    
}
