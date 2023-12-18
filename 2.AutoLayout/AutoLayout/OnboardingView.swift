//
//  OnboardingView.swift
//  AutoLayout
//
//  Created by matias on 18/12/2023.
//

import Foundation
import UIKit

final class OnboardingView: UIView {
    
    // MARK: - Subviews
    
    // Imagen de fondo para la vista de incorporación
    private let onBoardingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "image")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    // Etiqueta para mostrar el texto de incorporación
    private let textLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "AutoLayout"
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 32)
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    // Botón para omitir la incorporación
    private lazy var skipOnBoardingButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.title = "Skip Onboarding"
        
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(showMesssage), for: .touchUpInside)
        button.configuration = config
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Methods
    
    // Configura la vista agregando subvistas y aplicando restricciones de diseño
    private func setup() {
        addSubview()
        configure()
    }
    
    // Agrega las subvistas a la vista principal
    private func addSubview() {
        [onBoardingImageView, textLabel, skipOnBoardingButton].forEach(addSubview)
    }
    
    // Aplica restricciones de diseño utilizando AutoLayout
    private func configure() {
        NSLayoutConstraint.activate([
            onBoardingImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            onBoardingImageView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            
            textLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            textLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            skipOnBoardingButton.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 20),
            skipOnBoardingButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    // MARK: - Action Method
    
    // Método que se activa cuando se toca el botón "Skip Onboarding"
    @objc func showMesssage() {
        print("Skip onboarding")
    }
}
