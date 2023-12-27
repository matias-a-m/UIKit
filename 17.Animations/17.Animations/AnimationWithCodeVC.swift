//
//  AnimationWithCodeVC.swift
//  17.Animations
//
//  Created by matias on 26/12/2023.
//

import UIKit

class AnimationWithCodeVC: UIViewController {
    
    // Vista que se moverá con la animación
    lazy var myView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGreen
        return view
    }()
    
    // Restricción que controla la posición vertical de myView
    var centerYConstraint: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Agrega myView a la jerarquía de vistas y configura las restricciones
        view.addSubview(myView)
        setupView()
        
        // Inicia la animación después de un retraso de 1 segundo
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.animatedConstraint()
        }
    }
    
    // Configura las restricciones iniciales para myView
    func setupView() {
        centerYConstraint =  myView.centerYAnchor.constraint(equalTo: view.centerYAnchor)

        NSLayoutConstraint.activate([
            myView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            myView.heightAnchor.constraint(equalToConstant: 200),
            centerYConstraint!,
            myView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    // Anima la restricción centerYConstraint para mover myView hacia arriba
    func animatedConstraint() {
        UIView.animate(withDuration: 2) {
            // Modifica la constante para mover myView por encima del centro
            self.centerYConstraint?.constant = -200
            // Asegura que se actualice el diseño durante la animación
            self.view.layoutIfNeeded()
        }
    }
}
