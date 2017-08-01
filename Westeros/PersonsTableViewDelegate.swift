//
//  PersonsTableViewDelegate.swift
//  Westeros
//
//  Created by Tomás Ignacio Moyano on 8/1/17.
//  Copyright © 2017 Tomás Ignacio Moyano. All rights reserved.
//

import UIKit

final class PersonsTableViewDelegate: BaseViewControllerDelegate<Person>, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let person = source?.element(atIndexPath: indexPath),
            let nav = viewController?.navigationController{

            let personVc = PersonDetailViewController(model: person)
            nav.pushViewController(personVc, animated: true)
        }
    }
}
