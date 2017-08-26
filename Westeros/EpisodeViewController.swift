//
//  EpisodeViewController.swift
//  Westeros
//
//  Created by Tomás Ignacio Moyano on 8/26/17.
//  Copyright © 2017 Tomás Ignacio Moyano. All rights reserved.
//

import UIKit

class EpisodeViewController: UIViewController {

    var model: Episode
    @IBOutlet weak var charactersLabel: UILabel!
    
    @IBOutlet weak var screeningDateLabel: UILabel!
    
    init (model: Episode) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        
        title = model.title
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy"
        
        screeningDateLabel.text = formatter.string(from: model.screeningDate)
        
        //Get all members from all houses and show them in the label
        var membersString = ""
        
        for house:House in Repository.local.houses {
            let members:[Person] = house.sortedMembers()
            for member:Person in members {
                membersString.append("\(member.fullName), ")
            }
        }
        
        charactersLabel.text = membersString
    }
}
