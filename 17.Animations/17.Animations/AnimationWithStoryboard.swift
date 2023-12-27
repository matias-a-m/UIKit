//
//  AnimationWithStoryboard.swift
//  17.Animations
//
//  Created by matias on 27/12/2023.
//

import UIKit

class AnimationWithStoryboard: UIViewController {
    
    @IBOutlet var myView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configura el marco inicial de myView con un tamaño de 200x200 y posición centrada
        myView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        
        // Configura la opacidad inicial de myView a 0 (invisible)
        myView.alpha = 0.0
        
        // Centra myView en el centro de la vista principal
        myView.center = self.view.center
        
        // Inicia una animación con duración de 2 segundos, un retraso de 2 segundos,
        // utilizando efecto de resorte con damping de 0.1 y velocidad inicial de 1
        // Utiliza una curva de animación ease-in-out
        UIView.animate(withDuration: 2,
                       delay: 2,
                       usingSpringWithDamping: 0.1,
                       initialSpringVelocity: 1,
                       options: .curveEaseInOut) {
            // Durante la animación, ajusta el marco de myView a 300x300
            // Manteniendo el centro y cambiando la opacidad a 1 (visible)
            // Aplica un radio de esquina de 50 para esquinas redondeadas
            self.myView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
            self.myView.center = self.view.center
            self.myView.alpha = 1.0
            self.myView.layer.cornerRadius = 50
        }
    }
}


