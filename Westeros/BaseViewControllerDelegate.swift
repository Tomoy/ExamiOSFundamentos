//
//  BaseViewControllerDelegate.swift
//  Westeros
//
//  Created by Tomás Ignacio Moyano on 8/1/17.
//  Copyright © 2017 Tomás Ignacio Moyano. All rights reserved.
//

import UIKit

class BaseViewControllerDelegate<Element>: NSObject {
   
    var source : ArrayDataSource<Element>?
    weak var viewController : UIViewController?
}
