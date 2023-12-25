//
//  ViewController2.swift
//  15.XIBs
//
//  Created by matias on 24/12/2023.
//

import UIKit

class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

      
    }

    @IBAction func navigateToVC3(_ sender: Any){
        let viewController3 = ViewController3(nibName: "ViewController3", bundle: nil)
        self.present(viewController3, animated: true)
    }

}
