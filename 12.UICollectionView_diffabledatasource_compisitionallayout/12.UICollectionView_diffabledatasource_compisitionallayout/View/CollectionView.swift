//
//  CollectionView.swift
//  12.UICollectionView_diffabledatasource_compisitionallayout
//
//  Created by matias on 21/12/2023.
//

import UIKit

// Clase que representa la vista principal que contiene la UICollectionView
final class CollectionView: UIView {
    
    // Lazy var que inicializa y configura la UICollectionView
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeader.reuseIdentifier)
        return collectionView
    }()

    // Lazy var que inicializa y configura el datasource de la UICollectionView
    lazy var datasource: UICollectionViewDiffableDataSource<Int, DeviceCellViewModel> = {
        // Cierre que configura las celdas individuales
        let deviceCell = UICollectionView.CellRegistration<UICollectionViewCell, DeviceCellViewModel> { cell, indexPath, viewModel in
            // Elimina las subvistas antiguas antes de configurar la celda
            cell.contentView.subviews.forEach { $0.removeFromSuperview() }
            
            // Configuración visual de la celda
            cell.contentView.backgroundColor = .orange
            cell.contentView.layer.cornerRadius = 10
            
            let imageView = UIImageView()
            imageView.contentMode = .center
            imageView.image = UIImage(systemName: viewModel.imageName)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            cell.contentView.addSubview(imageView)
            
            let titleLabel = UILabel()
            titleLabel.text = viewModel.title
            titleLabel.textAlignment = .center
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            cell.contentView.addSubview(titleLabel)
            
            // Restricciones de Auto Layout para las subvistas
            NSLayoutConstraint.activate([
                imageView.centerXAnchor.constraint(equalTo: cell.contentView.centerXAnchor),
                imageView.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor),
                imageView.widthAnchor.constraint(equalToConstant: 30),
                imageView.heightAnchor.constraint(equalToConstant: 30),
                
                titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
                titleLabel.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 10),
                titleLabel.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -10),
                titleLabel.bottomAnchor.constraint(lessThanOrEqualTo: cell.contentView.bottomAnchor, constant: -10)
            ])
        }

        // DataSource que configura las secciones y celdas
        let datasource = UICollectionViewDiffableDataSource<Int, DeviceCellViewModel>(collectionView: collectionView) { collectionView, indexPath, viewModel in
            return collectionView.dequeueConfiguredReusableCell(using: deviceCell, for: indexPath, item: viewModel)
        }

        // Proveedor de vistas suplementarias (encabezados de sección)
        datasource.supplementaryViewProvider = { collectionView, kind, indexPath in
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeader.reuseIdentifier, for: indexPath) as? SectionHeader else {
                fatalError("Could not dequeue SectionHeader")
            }
            headerView.titleLabel.text = "Section \(indexPath.section + 1)"
            return headerView
        }

        return datasource
    }()

    lazy var viewModel: DeviceViewModel = {
        let homeDevices = [
            Device(title: "iPhone", imageName: "iphone"),
            Device(title: "iPad", imageName: "ipad"),
            Device(title: "MacBook", imageName: "macbook"),
            Device(title: "Apple Watch", imageName: "applewatch"),
            Device(title: "AirPods", imageName: "airpods"),
            Device(title: "Mac Pro", imageName: "macpro.gen1"),
        ]
        
        let officeDevices = [
            Device(title: "iPhone", imageName: "iphone"),
            Device(title: "iPad", imageName: "ipad"),
            Device(title: "MacBook", imageName: "macbook"),
            Device(title: "Apple Watch", imageName: "applewatch"),
            Device(title: "AirPods", imageName: "airpods"),
            Device(title: "Apple TV", imageName: "appletv")
        ]

        return DeviceViewModel(homeDevices: homeDevices, officeDevices: officeDevices)
    }()


    // MARK: - Initializers
    
    // Método de inicialización principal
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setup()
    }
    
    // Método de inicialización requerido al cargar desde un archivo xib o storyboard
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Methods
    
    // Método que realiza la configuración inicial de la vista
    private func setup() {
        addSubview()
        configure()
        configureCollectionViewLayout()
    }
    
    // Método que agrega la UICollectionView a la vista
    private func addSubview() {
        addSubview(collectionView)
    }
    
    // Método que configura las restricciones de la UICollectionView
    private func configure() {
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    // Método que configura el diseño de la UICollectionView y aplica un snapshot inicial
    private func configureCollectionViewLayout() {
        let screenWidth = UIScreen.main.bounds.width
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            let cellWidth = (screenWidth - 60) / 2
            layout.itemSize = CGSize(width: cellWidth, height: 150)
            layout.headerReferenceSize = CGSize(width: collectionView.bounds.width, height: 50)
        }

        var snapshot = datasource.snapshot()
        snapshot.appendSections([0, 1])

        for (sectionIndex, cellViewModelsInSection) in [viewModel.homeDevices, viewModel.officeDevices].enumerated() {
            let sectionViewModels = cellViewModelsInSection.map { DeviceCellViewModel(device: $0) }
            snapshot.appendItems(sectionViewModels, toSection: sectionIndex)
        }

        datasource.apply(snapshot)
    }
}
