//
//  SeasonsTableViewDelegate.swift
//  Westeros
//
//  Created by Tomás Ignacio Moyano on 8/9/17.
//  Copyright © 2017 Tomás Ignacio Moyano. All rights reserved.
//

import UIKit

final class SeasonsTableViewDelegate: BaseViewControllerDelegate<Season>, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let season = source?.element(atIndexPath: indexPath),
            let nav = viewController?.navigationController{
            
            //Inicio Tableviewcontroller para houses desde la clase genérica con ayuda del repositorio
            let seasonDataSource = DataSources.episodesDataSource(model: season.episodes)
            let episodesVC = ArrayTableViewController(dataSource: seasonDataSource, delegate: nil, title: "\(season.name)", style: .plain)
            
            nav.pushViewController(episodesVC, animated: true)
        }
    }
}
