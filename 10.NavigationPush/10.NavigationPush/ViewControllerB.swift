//
//  ViewControllerB.swift
//  10.NavigationPush
//
//  Created by matias on 21/12/2023.
//

import UIKit

class ViewControllerB: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemPurple
        
        title = "View Controller B"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .done, target: self, action: #selector(nextViewController))
    }
    
    @objc func nextViewController(){
        self.navigationController?.pushViewController(ViewControllerC(), animated: true)
    }
    
}
