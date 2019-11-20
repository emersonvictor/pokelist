//
//  PokemonDTO.swift
//  PokeList
//
//  Created by Emerson Victor on 19/11/19.
//  Copyright © 2019 emer. All rights reserved.
//

import Foundation

struct PokemonDTO: Codable {
    let id: Int
    let name: String
    let types: [PokemonTypeDTO]
    let stats: [StatDTO]
    let sprite: SpriteDTO

    enum CodingKeys: String, CodingKey {
        case id, name, types, stats
        case sprite = "sprites"
    }
}



