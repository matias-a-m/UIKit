//
//  ViewController.swift
//  13.DelegationPattern
//
//  Created by matias on 21/12/2023.
//

import UIKit

class ViewController: UIViewController {
    
    let apiCliet = APIClient()
    
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textAlignment = .center
        label.text = "Placeholder"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var button: UIButton = {
        var configuration = UIButton.Configuration.bordered()
        configuration.title = "Click"
        
        let button = UIButton(type: .system, primaryAction: UIAction(handler: { _ in
            self.didTapOnAcceptButton()
        }))
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var button2: UIButton = {
        var configuration = UIButton.Configuration.bordered()
        configuration.title = "VC2"
        
        let button = UIButton(type: .system, primaryAction: UIAction(handler: { _ in
            self.didTapPresentViewController2()
        }))
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [label, button, button2])
        stackView.axis = .vertical
        stackView.spacing = 20 // Ajusta el espaciado según tus necesidades
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Agrega el UIStackView a la vista principal
        view.addSubview(stackView)
        
        apiCliet.delegate = self
        
        // Centra el UIStackView en la vista principal
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func didTapOnAcceptButton() {
        // Implementa la lógica para manejar el evento de clic en el botón
        print("Button tapped!")
        apiCliet.getPokemon()
    }
    
    private func didTapPresentViewController2(){
        present(ViewController2(apiClient: APIClient()), animated: true)
    }
}

extension ViewController: APIClientDelegate{
    func updatePokemons(pokemons: PokemonResponseDataModel) {
        DispatchQueue.main.async {
            self.label.text = pokemons.pokemons.randomElement()?.name
        }
    }
    
    
}

