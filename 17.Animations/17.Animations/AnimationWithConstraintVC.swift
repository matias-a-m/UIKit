//
//  ViewController.swift
//  17.Animations
//
//  Created by matias on 26/12/2023.
//

import UIKit

class AnimationWithConstraintVC: UIViewController {

    let myView: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGreen
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(myView)
//        myView.alpha = 0.0
        myView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        myView.center = self.view.center
        
//        UIView.animate(withDuration: 2) {
//            self.myView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
//            self.myView.center = self.view.center
//            self.myView.alpha = 1.0
//            self.myView.layer.cornerRadius = 150
//        }
        
        UIView.animate(withDuration: 2,
                       delay: 2,
                       usingSpringWithDamping: 0.1,
                       initialSpringVelocity: 1,
                       options: .curveEaseInOut) {
            self.myView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
                       self.myView.center = self.view.center
                       self.myView.alpha = 1.0
                       self.myView.layer.cornerRadius = 50
        } completion: { isFinish in
            print("Did finish \(isFinish)")
            
            UIView.animate(withDuration: 1) {
                self.myView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
                           self.myView.center = self.view.center
                           self.myView.alpha = 1.0
                   
            }
            
        }

        
    }


}

