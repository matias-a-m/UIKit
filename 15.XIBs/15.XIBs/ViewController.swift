//
//  ViewController.swift
//  15.XIBs
//
//  Created by matias on 23/12/2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapOnButton(_ sender: Any) {
        let viewController2 = ViewController2(nibName: "ViewController2", bundle: nil)
        self.present(viewController2, animated: true)
    }
    
}

