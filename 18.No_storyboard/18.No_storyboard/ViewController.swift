//
//  ViewController.swift
//  18.No_storyboard
//
//  Created by matias on 27/12/2023.
//

// ViewController.swift

import UIKit

class ViewController: UIViewController {

    deinit {
        print("ViewController deinitialized")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewController viewDidLoad")

        // Configurar el color de fondo del propio ViewController
        self.view.backgroundColor = UIColor.white

        // Agregar un botón con UIAction
        let button = UIButton(type: .system)
        button.setTitle("Presentar Modal", for: .normal)
        button.addAction(UIAction(handler: { [weak self] _ in
            self?.presentModal()
        }), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(button)

        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    func presentModal() {
        // Instanciar el segundo ViewController
        let secondViewController = SecondViewController()

        // Presentar el segundo ViewController modalmente
        present(secondViewController, animated: true, completion: nil)
    }
}
