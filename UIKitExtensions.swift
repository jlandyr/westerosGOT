//
//  UIKitExtensions.swift
//  Westeros
//
//  Created by Bamby on 19/7/17.
//  Copyright © 2017 eureka apps. All rights reserved.
//

import Foundation
import UIKit


extension UIViewController{
    
    func wrappedInNavigation() -> UINavigationController {
        //exntesión para todos los UIViewController que permite poner un UIViewController dentro de UINavigationController
        return UINavigationController(rootViewController: self)
    }
}
