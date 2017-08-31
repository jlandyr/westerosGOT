//
//  SeasonEpisodesTableViewController.swift
//  Westeros
//
//  Created by Bamby on 31/8/17.
//  Copyright © 2017 eureka apps. All rights reserved.
//

import UIKit

class SeasonEpisodesTableViewController: UITableViewController {
        
    let model: [Episode]
    init(model:[Episode]) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder): has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Episodes"
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
        let cellID = "EpisodesCell"
        let member = model[indexPath.row]
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        
        if cell == nil{
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellID)
        }
        
        cell?.textLabel?.text = member.title
        cell?.detailTextLabel?.text = "broadcast: \(member.broadcastDate)"
        return cell!
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let episode = model[indexPath.row]
        let episodeVC = EpisodeViewController(model: episode)
        navigationController?.pushViewController(episodeVC, animated: true)
    }
    
}
