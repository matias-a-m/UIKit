//
//  ViewController.swift
//  UIButton
//
//  Created by matias on 18/12/2023.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Lifecycle Methods
    override func loadView() {
        self.view = ButtonsView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    

    
}

