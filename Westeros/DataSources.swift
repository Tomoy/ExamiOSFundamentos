//
//  DataSources.swift
//  Westeros
//
//  Created by Tomás Ignacio Moyano on 7/30/17.
//  Copyright © 2017 Tomás Ignacio Moyano. All rights reserved.
//

import UIKit

//Clase repositorio para construir los arrayDatasource de distintos tipos

final class DataSources {
    
    static func housesDataSource(model: [House]) -> ArrayDataSource<House> {
        
        //CellMaker es una clausura
        return ArrayDataSource(model: model, cellMaker: { (house: House, tableView: UITableView) -> UITableViewCell in
            
            let cellId = "HouseCell"
            var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
            
            if cell == nil {
                cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
            }
            
            cell?.imageView?.image = house.sigil.image
            cell?.textLabel?.text = house.name
            cell?.detailTextLabel?.text = "\(house.count) members"
            cell?.accessoryType = .disclosureIndicator
            
            return cell!
        })
    }
    
    static func personDataSource(model: [Person]) -> ArrayDataSource<Person> {
        
        //CellMaker es una clausura
        return ArrayDataSource(model: model, cellMaker: { (person: Person, tableView: UITableView) -> UITableViewCell in
            
            let cellId = "PersonCell"
            var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
            
            if cell == nil {
                cell = UITableViewCell(style: .default, reuseIdentifier: cellId)
            }
            
            cell?.textLabel?.text = person.fullName
            cell?.accessoryType = .disclosureIndicator
            
            return cell!
        })
    }
    
    static func seasonsDataSource(model: [Season]) -> ArrayDataSource<Season> {
        
        //CellMaker es una clausura
        return ArrayDataSource(model: model, cellMaker: { (season: Season, tableView: UITableView) -> UITableViewCell in
            
            let cellId = "SeasonCell"
            var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
            
            if cell == nil {
                cell = UITableViewCell(style: .default, reuseIdentifier: cellId)
            }
            
            cell?.textLabel?.text = season.name
            cell?.accessoryType = .disclosureIndicator
            
            return cell!
        })
    }
    
    static func episodesDataSource(model: [Episode]) -> ArrayDataSource<Episode> {
        
        //CellMaker es una clausura
        return ArrayDataSource(model: model, cellMaker: { (episode: Episode, tableView: UITableView) -> UITableViewCell in
            
            let cellId = "EpisodeCell"
            var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
            
            if cell == nil {
                cell = UITableViewCell(style: .default, reuseIdentifier: cellId)
            }
            
            cell?.textLabel?.text = episode.title
            
            return cell!
        })
    }
}
