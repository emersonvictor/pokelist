//
//  PokemonListDTO.swift
//  PokeList
//
//  Created by Emerson Victor on 19/11/19.
//  Copyright © 2019 emer. All rights reserved.
//

import Foundation

struct PokemonListDTO: Codable {
    let list: [PokemonRefDTO]

    enum CodingKeys: String, CodingKey {
        case list = "results"
    }
}
