//
//  ViewController2.swift
//  13.DelegationPattern
//
//  Created by matias on 22/12/2023.
//

import UIKit

class ViewController2: UIViewController {

    let apiCliet: APIClient

    init(apiClient: APIClient) {
        self.apiCliet = apiClient
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        print("deinit vc2")
    }

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

        let button = UIButton(type: .system, primaryAction: UIAction { [weak self] _ in
            self?.didTapOnAcceptButton()
        })
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [label, button])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(stackView)
        view.backgroundColor = .orange

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    private func didTapOnAcceptButton() {
        print("Button tapped!")
        apiCliet.getPokemon()
    }
}

extension ViewController2: APIClientDelegate {
    func updatePokemons(pokemons: PokemonResponseDataModel) {
        DispatchQueue.main.async {
            self.label.text = pokemons.pokemons.randomElement()?.name
        }
    }
}
