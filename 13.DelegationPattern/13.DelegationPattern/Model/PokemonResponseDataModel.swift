//
//  PokemonResponseDataModel.swift
//  13.DelegationPattern
//
//  Created by matias on 22/12/2023.
//

import Foundation

struct PokemonDataModel: Decodable{
    let name: String
    let url: String
}

struct PokemonResponseDataModel: Decodable{
    let pokemons: [PokemonDataModel]
    
    enum CodingKeys: String, CodingKey{
        case results
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.pokemons = try container.decode([PokemonDataModel].self, forKey: .results)
    }
}
