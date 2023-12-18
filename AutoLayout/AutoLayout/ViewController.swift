//
//  ViewController.swift
//  AutoLayout
//
//  Created by matias on 17/12/2023.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Lifecycle Methods
    
    // Se llama cuando la vista del controlador se carga por primera vez
    override func loadView() {
        // Asigna la instancia de OnboardingView como la vista principal del controlador
        self.view = OnboardingView()
    }
    
    // Se llama después de que la vista del controlador se ha cargado en la memoria
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Puedes realizar cualquier configuración adicional aquí, si es necesario
    }
    
    // Puedes agregar más métodos y funcionalidades según sea necesario
    
}


