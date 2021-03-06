//
//  AppDelegate.swift
//  Westeros
//
//  Created by Tomás Ignacio Moyano on 7/6/17.
//  Copyright © 2017 Tomás Ignacio Moyano. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // Crear RootWindow
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = UIColor.brown
        
        let houses = Repository.local.houses
        
        //Inicio Tableviewcontroller para houses desde la clase genérica con ayuda de DataSources
        let housesDataSource = DataSources.housesDataSource(model: houses)
        let housesVC = ArrayTableViewController(dataSource: housesDataSource, delegate: HousesTableViewDelegate(), title: "Westeros Houses", style: .plain).wrappedInNavigationController()
        
        //Inicio Tableviewcontroller para houses desde la clase genérica con ayuda del repositorio
        let seasonsDataSource = DataSources.seasonsDataSource(model: Repository.local.seasons)
        let seasonsVC = ArrayTableViewController(dataSource: seasonsDataSource, delegate: SeasonsTableViewDelegate(), title: "GOT Seasons", style: .plain).wrappedInNavigationController()
        
        let tabBarVC = UITabBarController()
        tabBarVC.viewControllers = [housesVC, seasonsVC]

        let tabBarItems = tabBarVC.tabBar.items! as [UITabBarItem]
        
        tabBarItems[0].image = #imageLiteral(resourceName: "housesIcon.png")
        tabBarItems[0].title = "Houses"
        tabBarItems[1].image = #imageLiteral(resourceName: "seasonsIcon.png")
        tabBarItems[1].title = "Seasons"

        
        window?.rootViewController = tabBarVC
                
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

