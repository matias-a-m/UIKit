//
//  ViewController.swift
//  11.UISheetPresentationController
//
//  Created by matias on 21/12/2023.
//

import UIKit

class ViewController: UIViewController {

    private lazy var button : UIButton = {
       
        var configuration = UIButton.Configuration.bordered()
        configuration.title = "Open sheet"
        
        let button = UIButton(type: .system, primaryAction: UIAction(handler: { _ in
            self.presentSheetViewController()
            
        }))
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = configuration
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemOrange
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.layoutMarginsGuide.centerYAnchor)
        ])
        
    }
    
    private func presentSheetViewController(){
        let viewController = SheetViewController()
        present(viewController, animated: true)
    }

}
