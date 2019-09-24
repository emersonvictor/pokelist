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
    func getPokelist() -> [Pokemon]? {
        do {
            /// Try to create pokelist from json
            let pokelistData: Data = try Data(contentsOf: URL(fileURLWithPath: self.jsonPath!))
            
            let pokelistFromJson = try JSONDecoder().decode([Pokemon].self, from: pokelistData)
            
            return pokelistFromJson
        } catch {
            /// Catch error and return nil instead of pokelist
            return nil
        }
    }
    
    // Save new pokemon into the pokelist json
    func save(pokelist: [Pokemon]) -> Bool {
        return true
    }
}
