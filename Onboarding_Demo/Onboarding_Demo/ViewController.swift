//
//  ViewController.swift
//  Onboarding_Demo
//
//  Created by matias on 17/12/2023.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet var label: UILabel!
    @IBOutlet var button: UIButton!
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    // MARK: - Actions
    @IBAction func action(_ sender: Any){
        // Este método se llama cuando se toca el botón vinculado en la interfaz.
        // Cambia el texto de la etiqueta a "hello-world" cuando se realiza la acción.
        label.text = "hello-world"
    }

}

