//
//  FileManager.swift
//  PokéList
//
//  Created by Emerson Victor on 11/09/19.
//  Copyright © 2019 emer. All rights reserved.
//

import Foundation

class FileLoader {
    
    // MARK: - Typealias
    typealias Id = Int
    
    // MARK: - Pokelist path
    var jsonPath = Bundle.main.path(forResource: "Pokelist", ofType: "json")
    
    // MARK: - Get pokelist from json
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
    
    // MARK: - Save new pokemon into the pokelist json
    func save(pokelist: [Pokemon]) -> Bool {
        do {
            let pokelistData = try JSONEncoder().encode(pokelist)
            try pokelistData.write(to: URL(fileURLWithPath: self.jsonPath!))
            
            return true
        } catch {
            /// Handle error
            return false 
        }
    }
}
