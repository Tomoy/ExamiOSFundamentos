//
//  EpisodesTableViewDelegate.swift
//  Westeros
//
//  Created by Tomás Ignacio Moyano on 8/26/17.
//  Copyright © 2017 Tomás Ignacio Moyano. All rights reserved.
//

import UIKit

final class EpisodesTableViewDelegate: BaseViewControllerDelegate<Episode>, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let episode = source?.element(atIndexPath: indexPath),
            
            let nav = viewController?.navigationController{
            let vc = EpisodeViewController(model: episode)
            nav.pushViewController(vc, animated: true )
        }
    }
}
