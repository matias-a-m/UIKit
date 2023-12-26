//
//  ViewController.swift
//  16.LifeCicle
//
//  Created by matias on 25/12/2023.
//

import UIKit

class ViewController: UIViewController {
    
    deinit{
        print("✨🧹✨")
    }
    
    // MARK: - Properties
    
    // Botón con configuración y acción para presentar otra instancia del ViewController
    private lazy var button: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Click me"
        
        // Utilizando [weak self] para evitar captura fuerte de referencia
        let button = UIButton(type: .system, primaryAction: UIAction(handler: { [weak self] action in
            self?.presentAnotherInstance()
//            self?.changeConstraintValue()
        }))
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = configuration
        
        return button
    }()
      
    var buttonConstraint: NSLayoutConstraint?
    
    // Array de colores de sistema para cambiar el fondo de la vista
    private let systemColors: [UIColor] = [
        .systemRed, .systemBlue, .systemGreen, .systemYellow,
        .systemOrange, .systemPurple, .systemTeal, .systemPink,
        .systemIndigo, .systemGray
    ]
    
    // MARK: - Lifecycle Methods
    
    // Este método se llama cuando la vista se carga en memoria.
    // Se agregan subvistas, lógica y restricciones, y se establece un color de fondo.
    override func viewDidLoad() {
        super.viewDidLoad()
        print("1. viewDidLoad: \(self.description)")
        
        // Agrega el botón a la vista
        view.addSubview(button)
        
        // Selecciona un color de sistema al azar y establece como color de fondo
        if let randomSystemColor = systemColors.randomElement() {
            view.backgroundColor = randomSystemColor
        }
        
        buttonConstraint = button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        
        // Aplica restricciones al botón para centrarlo en la vista
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
           buttonConstraint!
        ])
    }
    
    // Este método se llama cuando la vista está a punto de mostrarse en el view controller.
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("2. viewWillAppear: \(self.description)")
    }
    
    // Este método se llama para notificar al view controller que la vista está a punto de posicionar sus subvistas.
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("3. viewWillLayoutSubviews: \(self.description)")
        
        // Explicación del comportamiento en viewWillLayoutSubviews
//        print("   - Este método se llama antes de que la vista posicione sus subvistas.")
//        print("   - Es un buen lugar para realizar ajustes de diseño antes de que se realice la disposición final.")
    }
    
    // Este método notifica al view controller que la vista acaba de posicionar todas sus subvistas.
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("4. viewDidLayoutSubviews: \(self.description)")
    }
    
    // Este método se llama cuando la vista se ha cargado completamente en el view controller.
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("5. viewDidAppear: \(self.description)")
    }
    
    // Este método se llama cuando la vista está a punto de ser eliminada de la jerarquía de vistas.
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("6. viewWillDisappear: \(self.description)")
    }
    
    // Este método se llama después de que la vista se ha eliminado completamente de la jerarquía de vistas.
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("7. viewDidDisappear: \(self.description)")
    }
    
    // MARK: - Custom Methods
    
    // Método para presentar otra instancia del ViewController
    func presentAnotherInstance() {
        self.present(ViewController(), animated: true)
    }
    
    func changeConstraintValue(){
        view.removeConstraint(buttonConstraint!)
        buttonConstraint = button.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonConstraint!
        ])
    }
}
