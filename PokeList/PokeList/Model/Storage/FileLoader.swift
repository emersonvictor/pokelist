//
//  FileManager.swift
//  PokéList
//
//  Created by Emerson Victor on 11/09/19.
//  Copyright © 2019 emer. All rights reserved.
//

import Foundation

class FileLoader {
    
    // Pokemon id
    typealias Id = Int
    
    // Pokelist path
    var jsonPath = Bundle.main.path(forResource: "Pokelist", ofType: "json")
    
    // Get pokelist from json
    func getPokelist() -> [Pokemon] {
        return []
    }
    
    // Save new pokemon into the pokelist json
    func save(pokemon: Pokemon) -> Bool {
        return true
    }
}
