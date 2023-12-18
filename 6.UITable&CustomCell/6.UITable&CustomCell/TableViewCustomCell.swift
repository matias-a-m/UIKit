//
//  TableViewCustomCell.swift
//  6.UITable&CustomCell
//
//  Created by matias on 18/12/2023.
//

import UIKit

class TableViewCustomCell: UITableViewCell {
    
    // Imagen view para mostrar una imagen relacionada con el dispositivo
    private let deviceImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // Etiqueta para mostrar el nombre del dispositivo
    private let devicenNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Inicializador que configura la apariencia de la celda
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Agregar la imagen view y la etiqueta a la celda
        addSubview(deviceImageView)
        addSubview(devicenNameLabel)
        
        // Configurar restricciones para la disposición de las vistas en la celda
        NSLayoutConstraint.activate([
            deviceImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            deviceImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            deviceImageView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            deviceImageView.widthAnchor.constraint(equalToConstant: 40),
       
            devicenNameLabel.leadingAnchor.constraint(equalTo: deviceImageView.trailingAnchor, constant: 20),
            devicenNameLabel.centerYAnchor.constraint(equalTo: deviceImageView.centerYAnchor),
        ])
    }
    
    // Requerido por la herencia, pero no se utiliza en este caso
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Método para configurar la celda con un modelo de datos específico
    func configure(model: Devices){
        deviceImageView.image = UIImage(systemName: model.imageName)
        devicenNameLabel.text = model.title
    }

}
