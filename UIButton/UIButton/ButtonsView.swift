//
//  ButtonsView.swift
//  UIButton
//
//  Created by matias on 18/12/2023.
//

import Foundation
import UIKit

final class ButtonsView: UIView{
    
    private let button1: UIButton = {
        var config = UIButton.Configuration.filled()
        config.title = "Title"
        config.subtitle = "Subtitle"
        config.image = UIImage(systemName: "play.circle.fill")
        
        let button = UIButton(type: .system)
        button.configuration = config
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private let button2: UIButton = {
        var config = UIButton.Configuration.bordered()
        config.title = "Title"
        config.titleAlignment = .center
        config.subtitle = "Subtitle"
        config.image = UIImage(systemName: "play.circle.fill")
        config.imagePadding = 12
        config.imagePlacement = .trailing
        
        let button = UIButton(type: .system)
        button.configuration = config
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private let button3: UIButton = {
        var config = UIButton.Configuration.bordered()
        config.title = "Title"
        config.titleAlignment = .center
        config.subtitle = "Subtitle"
        config.image = UIImage(systemName: "play.circle.fill")
        config.imagePadding = 12
        config.imagePlacement = .top
        config.buttonSize = .large
        config.baseBackgroundColor = .systemPurple
        config.baseForegroundColor = .white
        
        let button = UIButton(type: .system)
        button.configuration = config
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    
    private lazy var button4: UIButton = {
        var config = UIButton.Configuration.bordered()
        config.title = "Title"
        config.titleAlignment = .center
        config.subtitle = "Subtitle"
        config.image = UIImage(systemName: "play.circle.fill")
        config.imagePadding = 12
        config.imagePlacement = .top
        config.buttonSize = .large

        
        let button = UIButton(type: .system, primaryAction: UIAction(handler:{ action in
            self.showMessage()
        }))
        button.configuration = config
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.button2, self.button3])
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
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
    
    private func setup() {
        addSubview()
        configure()
    }
    
    private func addSubview() {
        [button1,stackView, button4].forEach(addSubview)
    }
    
    private func configure() {
        NSLayoutConstraint.activate([
            button1.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            button1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            button1.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

            stackView.topAnchor.constraint(equalTo: button1.layoutMarginsGuide.bottomAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
         
            button4.topAnchor.constraint(equalTo: button3.layoutMarginsGuide.bottomAnchor, constant: 20),
            button4.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            button4.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        ])
    }
    
    // MARK: - Action Method
    @objc func showMessage() {
        print("hello-world")
    }
}


