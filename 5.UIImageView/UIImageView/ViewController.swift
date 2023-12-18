//
//  ViewController.swift
//  UIImageView
//
//  Created by matias on 18/12/2023.
//

import UIKit

class ViewController: UIViewController {
    
   private let imageView: UIImageView = {
       
       let imageView = UIImageView()
       imageView.contentMode = .scaleAspectFit
       imageView.tintColor = UIColor.lightGray
       imageView.image = UIImage(systemName: "gamecontroller.fill")
       imageView.translatesAutoresizingMaskIntoConstraints = false
       
       imageView.layer.cornerRadius = 140
       imageView.layer.borderWidth = 6
       imageView.layer.borderColor = UIColor.green.cgColor
       
       imageView.layer.shadowColor = UIColor.black.cgColor
       imageView.layer.shadowOpacity = 0.5
       imageView.layer.shadowOffset = CGSize(width: 0, height: 3)
       imageView.layer.shadowRadius = 5
       
       return imageView
   }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(imageView)
       
        NSLayoutConstraint.activate([
        
            imageView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 280),
            imageView.heightAnchor.constraint(equalToConstant: 280)
            
        ])
        
    }


}

