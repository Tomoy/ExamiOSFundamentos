//
//  HousesTableViewController.swift
//  Westeros
//
//  Created by Tomás Ignacio Moyano on 7/28/17.
//  Copyright © 2017 Tomás Ignacio Moyano. All rights reserved.
//

import UIKit

class HousesTableViewController: UITableViewController {
    
    let models : [House]
    
    init(models: [House]) {
        self.models = models
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Westeros Houses"
    }

    // MARK: - Table view data source methods

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return models.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "HouseCell"
        //Agarrar la casa para obtener la info que se va a mostrar en la cell
        let house = models[indexPath.row]
        
        //Crear una cell
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        
        if cell == nil {
            //Creamos una cell a mano
            cell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        }
        
        //Sincronizar la info de la casa con la cell
        cell?.imageView?.image = house.sigil.image
        cell?.textLabel?.text = house.name
        
        return cell!
    }
    
    // MARK: - Table view delegate methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let house = models[indexPath.row]
        let houseVC = HouseViewController(model: house)
        
        navigationController?.pushViewController(houseVC, animated: true)
    }
}
