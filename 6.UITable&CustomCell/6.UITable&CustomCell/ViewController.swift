//
//  ViewController.swift
//  6.UITable&CustomCell
//
//  Created by matias on 18/12/2023.
//

import UIKit

class ViewController: UIViewController {
    
    // Creación de una UITableView como propiedad privada
    private let devicesTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // Declaración de variables para el origen de datos y el delegado de la tabla
    private var dataSource: ViewControllerDataSource?
    private var delegate: ViewControllerDelegate?
    
    // Sobrescritura del método loadView
    override func loadView() {
        // Creación de una nueva instancia de UITableView
        let tableView = UITableView()
        
        // Inicialización de las instancias de origen de datos y delegado
        self.dataSource = ViewControllerDataSource(dataSource: house)
        self.delegate = ViewControllerDelegate()
        
        // Asignación del origen de datos y delegado a la nueva tabla
        tableView.dataSource = dataSource
        tableView.delegate = delegate
        
        // Registro de una celda personalizada para reutilización
        tableView.register(TableViewCustomCell.self, forCellReuseIdentifier: "custom-cell")
        
        // Asignación de la nueva tabla como la vista principal del controlador
        view = tableView
    }
}




