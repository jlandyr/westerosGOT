//
//  ArrayTableViewDelegate.swift
//  Westeros
//
//  Created by Bamby on 20/7/17.
//  Copyright © 2017 eureka apps. All rights reserved.
//

import Foundation
import UIKit

final class ArrayTableViewDelegate<Element>:NSObject , UITableViewDelegate{
    
    typealias Elements = [Element]
    typealias giveMeTheController = (Int) -> (UIViewController)
    
    let model: Elements
    private var _delegateFromController: UIViewController?
    private let _controller: giveMeTheController?
    
    init(model: Elements, controllerCreator: giveMeTheController?) {
        self.model = model
        _controller = controllerCreator
        
        super.init()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if _controller != nil {
            let newController: UIViewController = _controller!(indexPath.row)
            
            _delegateFromController?.navigationController?.pushViewController(newController, animated: true)
        }
    }
    
    func delegateOf(controller: UIViewController) {
        _delegateFromController = controller
    }
}
