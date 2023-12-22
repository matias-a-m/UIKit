//
//  ViewController.swift
//  11.UISheetPresentationController
//
//  Created by matias on 21/12/2023.
//

import UIKit

class SheetViewController: UIViewController {
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "hello world"
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .darkGray
       
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.layoutMarginsGuide.centerYAnchor)
        ])
        
        guard let presentationController = presentationController as? UISheetPresentationController else{
            return
        }
            
        presentationController.detents = [.medium(), .large()]
        presentationController.selectedDetentIdentifier = .medium
        presentationController.prefersGrabberVisible = true
        presentationController.preferredCornerRadius = 20
        
    }

    

}

