//
//  DataSource.swift
//  6.UITable&CustomCell
//
//  Created by matias on 18/12/2023.
//

import Foundation
import UIKit

final class ViewControllerDataSource: NSObject, UITableViewDataSource {
    
    // Matriz bidimensional que contiene los datos organizados por sección
    private let dataSource: [[Devices]]
    
    // Inicializador que recibe la matriz bidimensional de datos
    init(dataSource: [[Devices]]) {
        self.dataSource = dataSource
    }
    
    // Número de secciones en la tabla (corresponde al número de arrays en dataSource)
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    // Número de filas en cada sección (corresponde al número de elementos en cada array)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource[section].count
    }
    
    // Configuración de celda para una posición específica en la tabla
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Obtener una celda reutilizable del tipo TableViewCustomCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "custom-cell", for: indexPath) as! TableViewCustomCell
        
        // Obtener el modelo de datos correspondiente a la posición en la tabla
        let model = dataSource[indexPath.section][indexPath.row]
        
        // Configurar la celda con el modelo de datos
        cell.configure(model: model)
        
        // Devolver la celda configurada
        return cell
    }
    
    // Título para la sección específica en la tabla
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        // Establecer títulos diferentes para diferentes secciones
        if section == 0 {
            return "Device House"
        } else {
            return "Device Work"
        }
    }
}
