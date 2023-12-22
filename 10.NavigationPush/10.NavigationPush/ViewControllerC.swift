//
//  ViewControllerC.swift
//  10.NavigationPush
//
//  Created by matias on 21/12/2023.
//

import UIKit

class ViewControllerC: UIViewController {
    
    private lazy var button: UIButton = {
        var configuration = UIButton.Configuration.bordered()
        configuration.title = "Back to root ViewController"
        
        let button = UIButton(type: .system, primaryAction: UIAction(handler:{ _ in
            self.startModal()
            
        }))
        
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemOrange
        title = "View Controller C"
        
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            
        ])
        
        
    }
    
    func startModal(){
//        self.present(ViewControllerD(), animated: true)
        self.navigationController?.popToRootViewController(animated: true)
    }
    

}
