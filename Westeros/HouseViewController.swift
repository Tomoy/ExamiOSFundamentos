//
//  HouseViewController.swift
//  Westeros
//
//  Created by Tomás Ignacio Moyano on 7/10/17.
//  Copyright © 2017 Tomás Ignacio Moyano. All rights reserved.
//

import UIKit

class HouseViewController: UIViewController {
    
    

    @IBOutlet weak var houseNameLabel: UILabel!
    @IBOutlet weak var wordsLabel: UILabel!
    @IBOutlet weak var sigilImageView: UIImageView!
    
    
    let model: House
    
    init(model: House) {
        self.model = model
        super.init(nibName: "HouseDetailView", bundle: nil)
        self.title = model.name
        
    }
    
    func setupUI() {
        
        let wikiButton = UIBarButtonItem(title: "Wiki", style: .plain, target: self, action: #selector(displayWiki))
        let personsButton = UIBarButtonItem(title: "Persons", style: .plain, target: self, action: #selector(displayPersons))
        
        navigationItem.rightBarButtonItems = [personsButton,wikiButton]
    }
    
    @objc func displayWiki() {
        
        let wikiVC = WikiViewController(model: model)
        
        navigationController?.pushViewController(wikiVC, animated: true)
    }
    
    @objc func displayPersons() {
        
        let dataSource = DataSources.personDataSource(model: model.sortedMembers())
        let personsVC = ArrayTableViewController(dataSource: dataSource, delegate: PersonsTableViewDelegate(), title: "Westeros Houses", style: .plain)
        
        navigationController?.pushViewController(personsVC, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupUI()
        syncViewWithModel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func syncViewWithModel() {
        houseNameLabel.text = "House \(model.name)"
        sigilImageView.image = model.sigil.image
        wordsLabel.text = model.words
    }
}
