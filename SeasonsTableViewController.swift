//
//  SeasonsTableViewController.swift
//  Westeros
//
//  Created by Bamby on 31/8/17.
//  Copyright © 2017 eureka apps. All rights reserved.
//

import UIKit

class SeasonsTableViewController: UITableViewController {
        
    let model: [Season]
    init(model:[Season]) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder): has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Seasons"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UITableView
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "SeasonsCell"
        let season = model[indexPath.row]
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        
        if cell == nil{
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellID)
        }
        
        cell?.textLabel?.text = season.name
        cell?.detailTextLabel?.text = "release: \(season.releaseDate)"
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let season = model[indexPath.row].sortedSeason()
        let seasonsEpisodesVC = SeasonEpisodesTableViewController(model: season)
        navigationController?.pushViewController(seasonsEpisodesVC, animated: true)
    }
    
}
