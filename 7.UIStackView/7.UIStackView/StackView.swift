//
//  StackView.swift
//  7.UIStackView
//
//  Created by matias on 19/12/2023.
//

import UIKit

final class StackView: UIView {
    
    private var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "🤑 In App Purchase 🤑"
        label.textAlignment = .center
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 24)
        
        return label
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        return stackView
    }()

    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Methods
    
    private func setup() {
        addSubview(label)  // Add label to the view
        addSubview(stackView)
        configure()
    }
    
    private func configure() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 20),
            label.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -20),
            
            stackView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 40),
            stackView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor)
        ])
        
        ["1.99€", "2.99€", "14.99€", "24.99€"].forEach { price in
            let button = UIButton(type: .system)
            var conf = UIButton.Configuration.borderedTinted()
            conf.title = price
            conf.subtitle = "Subscription"
            conf.image = UIImage(systemName: "eurosign.circle.fill")
            conf.imagePadding = 12
            conf.baseBackgroundColor = .systemBlue
            button.configuration = conf

            stackView.addArrangedSubview(button)
        }
    }
}
