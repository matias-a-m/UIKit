//
//  ViewController.swift
//  14.Storyboard
//
//  Created by matias on 22/12/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func didTapButton(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController2 = storyboard.instantiateViewController(withIdentifier: "viewController2_identifier")
        self.present(viewController2, animated: true)
    }
    

}

