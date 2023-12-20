//
//  ViewController.swift
//  9.NavigationModal
//
//  Created by matias on 19/12/2023.
//

import UIKit

class ViewControllerA: UIViewController {

    private lazy var presentVCButton: UIButton = {
        var configuration = UIButton.Configuration.bordered()
        configuration.title = "Present VC B"
        configuration.baseForegroundColor = .white
        
        let button = UIButton(type: .system, primaryAction: UIAction(handler: { _ in
            self.startNavigation()
        }))
        
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemMint
        view.addSubview(presentVCButton)
        
        NSLayoutConstraint.activate([
            presentVCButton.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            presentVCButton.centerYAnchor.constraint(equalTo: view.layoutMarginsGuide.centerYAnchor),
        ])
        
    }

    func startNavigation(){
        present(ViewControllerB(), animated: true)
        
    }

}

