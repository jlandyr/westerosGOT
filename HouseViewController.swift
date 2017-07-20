//
//  HouseViewController.swift
//  Westeros
//
//  Created by Bamby on 17/7/17.
//  Copyright © 2017 eureka apps. All rights reserved.
//

import UIKit

class HouseViewController: UIViewController {

    @IBOutlet weak var labelHouseName: UILabel!
    @IBOutlet weak var labelWords: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    let model: House
    init(model:House) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        self.title = model.name
    }
    
    //implementar este método cuando se crea super.init(nibName: nil, bundle: nil)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init coder not initialized")
    }
    
    func syncViewWithModel(){
        //model -> view
        self.labelHouseName.text = "House: \(self.model.name)"
        self.image.image = self.model.sigil.image
        self.labelWords.text = self.model.name
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        syncViewWithModel()
        setupUI()
    }
    
    func setupUI() {
        //creamos UIBarButtonItem
        let buttonWiki = UIBarButtonItem(title: "Wiki", style: .plain, target: self, action:#selector(displayWiki))
        let buttonMembers = UIBarButtonItem(title: "Members", style: .plain, target: self, action:#selector(displayMembers))
        //añadimos UIBarButtonItem al UINavigation
        navigationItem.rightBarButtonItems = [buttonWiki, buttonMembers]
    }
    
    func displayWiki(){
        let wikiVC = WikiViewController(model: model)
        navigationController?.pushViewController(wikiVC, animated: true)
        //el ? en navigationController indica: si la vista actual tiene un navigation entonces ejecuta el método pushViewController
    }
    
    func displayMembers(){
        let membersVC = MembersTableViewController(model: model.sortedMembers())
        navigationController?.pushViewController(membersVC, animated: true)
    }
}
