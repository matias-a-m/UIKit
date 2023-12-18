//
//  ViewController.swift
//  UILabel
//
//  Created by matias on 18/12/2023.
//

import UIKit

class ViewController: UIViewController {

    override func loadView() {
        self.view = LabelView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }


}

