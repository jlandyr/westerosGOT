//
//  Delegates.swift
//  Westeros
//
//  Created by Bamby on 20/7/17.
//  Copyright © 2017 eureka apps. All rights reserved.
//

import Foundation
import UIKit

final class Delegates{
    
    static func housesDelegate(model: [House]) -> ArrayTableViewDelegate<House> {
        return ArrayTableViewDelegate(model: model, controllerCreator: { (posElement: Int) -> (UIViewController) in
            return HouseViewController(model: model[posElement])
        })
    }
    
    static func personsDelegate(model: [Person]) -> ArrayTableViewDelegate<Person> {
        return ArrayTableViewDelegate(model: model, controllerCreator: nil)
    }
}

//class BaseViewControllerDelegate<Element>: NSObject{
//    var source : ArrayDataSource<Element>?
//    var viewController : UIViewController?
//}
//final class GreatHousesDelegate: BaseViewControllerDelegate<House>, UITableViewDelegate{
//    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if let house = source?.element(atIndexPath: indexPath), let nav = viewController?.navigationController{
//            let vc = HouseViewController(model: house)
//            nav.pushViewController(vc, animated: true)
//        } }
//}
