//
//  PokeapiManager.swift
//  PokéList
//
//  Created by Emerson Victor on 11/09/19.
//  Copyright © 2019 emer. All rights reserved.
//

import Foundation

class PokeapiManager {
    
    // MARK: - Get list of all pokemons
    static func getPokemon() -> [Pokemon] {
        return []
    }
    
    // MARK: - Get list of pokemon from position
    static func getPokemon(from position: String) -> [Pokemon] {
        return []
    }
    
    // MARK: - Get pokemon from id
    static func getPokemon(with id: String) -> Pokemon {
        return Pokemon(id: 1, name: "Bulbasaur", hp: 49, attack: 45, defense: 45, types: [PokeType(name: "normal")])
    }
}
