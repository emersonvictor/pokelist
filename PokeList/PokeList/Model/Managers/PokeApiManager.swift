////
////  PokeApiManager.swift
////  PokeList
////
////  Created by Emerson Victor on 03/10/19.
////  Copyright © 2019 emer. All rights reserved.
////
//
//import Foundation
//
//class PokeApiManager {
//    
//    // MARK: - Single instance
//    public static let shared = PokeApiManager()
//    
//    // MARK: - Initializer
//    private init() {}
//    
//    // MARK: - Attributes
//    private let baseUrl = "https://pokeapi.co/api/v2/"
//    private let session = URLSession.shared
//    
//    // MARK: - Request to PokeApi with an URL
//    func getPokemonList() {
//        let pokeapiURL = URL(string: self.baseUrl + "pokemon/?limit=1000&offset=0")
//        
//        let task = URLSession.shared.dataTask(with: pokeapiURL!) { (result) in
//            switch result {
//            case .success(_, let data):
//                self.decodePokemon(fromData: data)
//                break
//            case .failure(let error):
//                print(error)
//                break
//            }
//        }
//        
//        task.resume()
//    }
//    
//    // MARK: - Format JSON data to Pokemon
//    private func decodePokemon(fromData data: Data) {
//        do {
//            // make sure this JSON is in the format we expect
//            let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
//            let results = json!["results"] as? [[String: Any]]
//            
//        } catch let error as NSError {
//            print("Failed to load: \(error.localizedDescription)")
//        }
//    }
//    
//    // MARK: - Format JSON data to Pokemon array
//    private func decodePokemonList(fromData data: Data) {
//        do {
//            // make sure this JSON is in the format we expect
//            let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
//            let results = json!["results"] as? [[String: Any]]
//        } catch let error as NSError {
//            print("Failed to load: \(error.localizedDescription)")
//        }
//    }
//}
