//
//  PokeApiManager.swift
//  PokeList
//
//  Created by Emerson Victor on 03/10/19.
//  Copyright © 2019 emer. All rights reserved.
//

import Foundation

class PokeApiManager {
        
    // MARK: - Attributes
    private static let baseUrl = "https://pokeapi.co/api/v2/pokemon"
    
    // MARK: - Get all pokemon
    class func getPokemonList(results: @escaping (_ pokemonBaseList: PokemonListDTO) -> Void) {
        let urlString = "\(baseUrl)?limit=2000"
        let url = URL(string: urlString)!
        
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            /// Error case
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            /// Empty case
            guard let _ = response, let data = data else {
                print("Empty response")
                return
            }
            
            /// Success case
            let basePokemonList = try? JSONDecoder().decode(PokemonListDTO.self, from: data)
            if let basePokemonList = basePokemonList {
                results(basePokemonList)
            }
        }.resume()
        
    }
    
    // MARK: - Get pokemon detail
    // /name
    class func getPokemonDetails(named name: String,
                                 results: @escaping (_ pokemonDetails: PokemonDTO) -> Void) {
        let urlString = "\(baseUrl)/\(name)"
        let url = URL(string: urlString)!
        
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            /// Error case
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            /// Empty case
            guard let _ = response, let data = data else {
                print("Empty response")
                return
            }
            
            /// Success case
            let pokemonDetails = try? JSONDecoder().decode(PokemonDTO.self, from: data)
            if let pokemonDetails = pokemonDetails {
                results(pokemonDetails)
            }
        }.resume()
    }
    
    // MARK: - Get pokemon image
    // url
    class func getPokemonImage(withUrl urlString: String) {
        
    }
}
