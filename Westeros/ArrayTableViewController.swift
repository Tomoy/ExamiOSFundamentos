//
//  ArrayTableViewController.swift
//  Westeros
//
//  Created by Tomás Ignacio Moyano on 7/30/17.
//  Copyright © 2017 Tomás Ignacio Moyano. All rights reserved.
//

import UIKit

class ArrayTableViewController<Element>: UITableViewController {
    
    let dataSource : ArrayDataSource<Element>
    let delegate   : BaseViewControllerDelegate<Element>?
    
    init(dataSource: ArrayDataSource<Element>, delegate: BaseViewControllerDelegate<Element>? = nil, title: String, style: UITableViewStyle) {
        
        self.dataSource = dataSource
        self.delegate = delegate
        
        super.init(style: style)
        
        self.title = title
        
        tableView.dataSource = self.dataSource
        
        delegate?.source = self.dataSource
        delegate?.viewController = self
        tableView.delegate = self.delegate as? UITableViewDelegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
