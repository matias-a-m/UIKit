//
//  ViewControllerB.swift
//  9.NavigationModal
//
//  Created by matias on 20/12/2023.
//

import UIKit

class ViewControllerB: UIViewController {

    private lazy var dismissVCButton: UIButton = {
        var configuration = UIButton.Configuration.bordered()
        configuration.title = "Dismiss VC B"
        configuration.baseForegroundColor = .white
        
        let button = UIButton(type: .system, primaryAction: UIAction(handler: { _ in
            self.dissmisViewControllerB()
        }))
        
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
        
    }()
    
    private lazy var presentVCButton: UIButton = {
        var configuration = UIButton.Configuration.bordered()
        configuration.title = "Present VC C"
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
        
        view.backgroundColor = .systemOrange

        view.addSubview(dismissVCButton)
        view.addSubview(presentVCButton)
        
        NSLayoutConstraint.activate([
            presentVCButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            presentVCButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            dismissVCButton.topAnchor.constraint(equalTo: presentVCButton.bottomAnchor, constant: 20),
            dismissVCButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
       
    }
    
    func dissmisViewControllerB(){
        dismiss(animated: true)
    }

    func startNavigation(){
        present(ViewControllerC(), animated: true)
        
    }

}
