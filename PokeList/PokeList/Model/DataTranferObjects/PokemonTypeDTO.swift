//
//  PokemonTypeDTO.swift
//  PokeList
//
//  Created by Emerson Victor on 19/11/19.
//  Copyright © 2019 emer. All rights reserved.
//

import Foundation

struct PokemonTypeDTO: Codable {
    typealias TypeInfoDTO = InfoDTO
    
    let slot: Int
    let type: TypeInfoDTO
}

