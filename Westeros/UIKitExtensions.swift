//
//  UIKitExtensions.swift
//  Westeros
//
//  Created by Tomás Ignacio Moyano on 7/11/17.
//  Copyright © 2017 Tomás Ignacio Moyano. All rights reserved.
//

import UIKit


//Extensión de UIViewcontroller para hacer que cualquier viewcontroller se embeba en un UINavigationController como el rootVC
extension UIViewController {
    
    func wrappedInNavigationController() -> UINavigationController {
        let nav = UINavigationController(rootViewController: self)
        return nav
    }
}
