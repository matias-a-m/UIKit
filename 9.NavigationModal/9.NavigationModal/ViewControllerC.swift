//
//  ViewControllerC.swift
//  9.NavigationModal
//
//  Created by matias on 20/12/2023.
//

import UIKit

class ViewControllerC: UIViewController {

    private lazy var dismissVCButton: UIButton = {
        var configuration = UIButton.Configuration.bordered()
        configuration.title = "Dismiss VC C"
        configuration.baseForegroundColor = .white
        
        let button = UIButton(type: .system, primaryAction: UIAction(handler: { _ in
            self.dissmisViewControllerC()
        }))
        
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemPink

        view.addSubview(dismissVCButton)
        
        NSLayoutConstraint.activate([
            dismissVCButton.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            dismissVCButton.centerYAnchor.constraint(equalTo: view.layoutMarginsGuide.centerYAnchor),
        ])
       
    }
    
    func dissmisViewControllerC(){
        dismiss(animated: true)
    }


}
