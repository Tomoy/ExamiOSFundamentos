//
//  ArrayTableViewDelegate.swift
//  Westeros
//
//  Created by Tomás Ignacio Moyano on 7/30/17.
//  Copyright © 2017 Tomás Ignacio Moyano. All rights reserved.
//

import UIKit

final class HousesTableViewDelegate: BaseViewControllerDelegate<House>, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let house = source?.element(atIndexPath: indexPath),
            let nav = viewController?.navigationController{
            let vc = HouseViewController(model: house)
            nav.pushViewController(vc, animated: true )
        }
    }
}
