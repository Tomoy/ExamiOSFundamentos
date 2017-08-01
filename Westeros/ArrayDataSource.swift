//
//  ArrayDataSource.swift
//  Westeros
//
//  Created by Tomás Ignacio Moyano on 7/29/17.
//  Copyright © 2017 Tomás Ignacio Moyano. All rights reserved.
//

import UIKit

//Array de tipo genéricos
final class ArrayDataSource<Element> : NSObject, UITableViewDataSource {
    
    typealias Elements = [Element]
    //Clausura para crear la celda genérica, devuelve la celda creada
    typealias CellMaker = (Element, UITableView) -> UITableViewCell
    
    private let _model : Elements
    private let _cellMaker : CellMaker
    
    init(model: Elements, cellMaker: @escaping CellMaker) {
        _model = model
        _cellMaker = cellMaker
        
        super.init()
    }
    
    // Función que devuelve el elemento del array según el
    // indexpath.
    func element(atIndexPath indexPath: IndexPath)->Element{
        return _model[indexPath.row]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _model.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let elem = _model[indexPath.row]
        
        return _cellMaker(elem, tableView)
    }
}
