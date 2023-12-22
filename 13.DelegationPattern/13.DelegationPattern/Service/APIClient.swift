//
//  APIClient.swift
//  13.DelegationPattern
//
//  Created by matias on 22/12/2023.
//

import Foundation

protocol APIClientDelegate: AnyObject{
    func updatePokemons(pokemons: PokemonResponseDataModel)
}

class APIClient {
    
    weak var delegate: APIClientDelegate?
    
    func getPokemon() {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=151") else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let dataModel = try JSONDecoder().decode(PokemonResponseDataModel.self, from: data)
                print("DataModel: \(dataModel)")
                self.delegate?.updatePokemons(pokemons: dataModel)
            } catch {
                print("Error decoding data: \(error)")
            }
        }
        task.resume()
    }
}
