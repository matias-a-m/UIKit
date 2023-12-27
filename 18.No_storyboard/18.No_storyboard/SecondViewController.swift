//
//  SecondViewController.swift
//  18.No_storyboard
//
//  Created by matias on 27/12/2023.
//

import UIKit

class SecondViewController: UIViewController {

    deinit {
           print("SecondViewController deinitialized")
       }

       override func viewDidLoad() {
           super.viewDidLoad()
           print("SecondViewController viewDidLoad")

           // Configurar el color de fondo del segundo ViewController
           self.view.backgroundColor = UIColor.lightGray
       }

}
