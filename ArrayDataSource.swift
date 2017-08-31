//
//  ArrayDataSource.swift
//  Westeros
//
//  Created by Bamby on 20/7/17.
//  Copyright © 2017 eureka apps. All rights reserved.
//

import Foundation
import UIKit

final class ArrayDataSource<Element> : NSObject, UITableViewDataSource{
    //implementa NSObject para que no genere error al no implementar todos los métodos de UITableViewDataSource
    
    typealias Elements = [Element]
    typealias CellMaker = (Element,UITableView)->UITableViewCell
    
    private let _model: Elements
    private let _cellMaker : CellMaker
    
    init(model:Elements, cellMaker:@escaping CellMaker) {
        _model = model
        _cellMaker = cellMaker
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _model.count
    }
    func element(atIndexPath indexPath: IndexPath)->Element{
        return _model[indexPath.row]
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let data = _model[indexPath.row]
        
        return _cellMaker(data,tableView)
    }

    
    


}
