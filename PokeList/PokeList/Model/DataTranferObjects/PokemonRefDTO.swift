//
//  PokemonRefDTO.swift
//  PokeList
//
//  Created by Emerson Victor on 19/11/19.
//  Copyright © 2019 emer. All rights reserved.
//

import Foundation

struct PokemonRefDTO: Codable {
    let name: String

    enum CodingKeys: String, CodingKey {
        case name
    }
}
