//
//  AppDelegate.swift
//  Westeros
//
//  Created by Bamby on 5/7/17.
//  Copyright © 2017 eureka apps. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        //1. Creamos window
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = UIColor.cyan
        
        //2. Creamos RootViewController
//        let rootVC = UIViewController()
//        window?.rootViewController = rootVC
//        return true
        
        
        //2. Creamos modelo
        let houses = Repository.local.houses
        
        //3. Creamos controlador
        var controllers = [UIViewController]()
        for house in houses{
            controllers.append(HouseViewController(model: house).wrappedInNavigation())
        }
        
        //4. Creamos UINavigation
//        let starkNav = UINavigationController(rootViewController: starkVC)
//        let lannisterNav = UINavigationController(rootViewController: lannisterVC)
        
        
        //5. Creamos UITabBar
        let tabVC = UITabBarController()
        tabVC.viewControllers = controllers
        
        //Creamos tableView
        
        
        //6. Asignamos el RootVC
        window?.rootViewController = tabVC
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

