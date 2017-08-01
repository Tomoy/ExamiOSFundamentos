//
//  PersonDetailViewController.swift
//  Westeros
//
//  Created by Tomás Ignacio Moyano on 8/1/17.
//  Copyright © 2017 Tomás Ignacio Moyano. All rights reserved.
//

import UIKit

class PersonDetailViewController: UIViewController {

    @IBOutlet weak var personName: UILabel!
    @IBOutlet weak var alias: UILabel!
    
    let model: Person

    init(model: Person) {
        self.model = model
        super.init(nibName: "PersonDetailView", bundle: nil)
        self.title = "Person Detail"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        personName.text = model.fullName
        
        var aliasText = ""
        
        if model.alias != "" {
            aliasText = "< \(model.alias) >"
        }
        
        alias.text = aliasText
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
