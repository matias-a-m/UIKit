//
//  ViewController.swift
//  12.UICollectionView_diffabledatasource_compisitionallayout
//
//  Created by matias on 21/12/2023.
//

import UIKit

class ViewController: UIViewController {

    // Crea una UICollectionView inicializada de forma perezosa con una configuración de diseño de lista
    lazy var collectionView: UICollectionView = {
        let configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    // Crea un UICollectionViewDiffableDataSource inicializado de forma perezosa para gestionar los datos de la colección
    lazy var datasource: UICollectionViewDiffableDataSource<Int, Device> = {
        // Definir un registro de celda para UICollectionViewListCell con un modelo de dispositivo (Device)
        let deviceCell = UICollectionView.CellRegistration<UICollectionViewListCell, Device> { cell, indexPath, model in
            var listContentConfiguration = UIListContentConfiguration.cell()
            listContentConfiguration.text = model.title
            listContentConfiguration.image = UIImage(systemName: model.imageName)
            cell.contentConfiguration = listContentConfiguration
        }
    
        // Crea el origen de datos diferenciable utilizando el registro de celda y la colección
        let datasource = UICollectionViewDiffableDataSource<Int, Device>(collectionView: collectionView) { collectionView, indexPath, model in
            return collectionView.dequeueConfiguredReusableCell(using: deviceCell, for: indexPath, item: model)
        }
        return datasource
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        // Establece el color de fondo de la colección
        collectionView.backgroundColor = .systemGreen
        
        // Agregarla colección a la jerarquía de vistas
        view.addSubview(collectionView)
        
        // Configura restricciones para que la colección llene toda la vista
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        // Crea una instantánea inicial y llenarla con secciones e ítems
        var snapshot = datasource.snapshot()
        snapshot.appendSections([0, 1])
        snapshot.appendItems(home, toSection: 0)
        snapshot.appendItems(office, toSection: 1)
        
        // Aplica la instantánea inicial al origen de datos
        datasource.apply(snapshot)
        
        // Después de un retraso de 2 segundos, agregar nuevos ítems a cada sección y aplicar la instantánea actualizada
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            snapshot.appendItems([.init(title: "nuevo dispositivo", imageName: "appletv")], toSection: 0)
            snapshot.appendItems([.init(title: "nuevo dispositivo 2", imageName: "appletv")], toSection: 1)
            self.datasource.apply(snapshot)
        }
    }
}
