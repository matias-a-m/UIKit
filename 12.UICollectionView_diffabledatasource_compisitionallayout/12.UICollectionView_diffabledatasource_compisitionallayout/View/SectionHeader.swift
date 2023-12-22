//
//  SectionHeader.swift
//  12.UICollectionView_diffabledatasource_compisitionallayout
//
//  Created by matias on 21/12/2023.
//

import UIKit

// Clase que representa la cabecera de una sección en una UICollectionView
class SectionHeader: UICollectionReusableView {
    
    // Identificador reutilizable para la vista de cabecera de sección
    static let reuseIdentifier = "SectionHeader"
    
    // Etiqueta que mostrará el título de la sección
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    // Método de inicialización que se llama cuando se crea una nueva instancia de la clase
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Agrega la etiqueta titleLabel como subvista de la vista de la cabecera
        addSubview(titleLabel)
        
        // Desactiva la máscara de traducción automática en restricciones para usar Auto Layout
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Configura las restricciones de Auto Layout para la etiqueta titleLabel
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    // Método de inicialización requerido cuando se crea una instancia desde un archivo xib o storyboard
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
