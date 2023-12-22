//
//  ViewController.swift
//  10.NavigationPush
//
//  Created by matias on 21/12/2023.
//

import UIKit

class ViewControllerA: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = .systemGreen
        
        title = "View Controller A"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .done, target: self, action: #selector(nextViewController))
    }

    @objc func nextViewController(){
        self.navigationController?.pushViewController(ViewControllerB(), animated: true)
    }

}

