//
//  ViewController.swift
//  7.UIStackView
//
//  Created by matias on 19/12/2023.
//
import UIKit

class ViewController: UIViewController {
    
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

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(stackView)
        view.addSubview(label)

        NSLayoutConstraint.activate([
            
            label.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20),
            label.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: 20),
            
            stackView.topAnchor.constraint(equalTo: label.layoutMarginsGuide.topAnchor, constant: 40),
            stackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)
            
            
            
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
