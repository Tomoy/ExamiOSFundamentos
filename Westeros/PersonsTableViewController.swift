//
//  PersonsTableViewController.swift
//  Westeros
//
//  Created by Tomás Ignacio Moyano on 7/29/17.
//  Copyright © 2017 Tomás Ignacio Moyano. All rights reserved.
//

import UIKit

class PersonsTableViewController: UITableViewController {
    
    var model : [Person]
    
    init(model:[Person]) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Members"

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "PersonCell"

        let person:Person = model[indexPath.row]
        
        //Crear una cell
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        
        if cell == nil {
            //Creamos una cell a mano
            cell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        }
        
        //Sincronizar la info de la casa con la cell
        cell?.textLabel?.text = person.fullName
        
        return cell!
    }
}
