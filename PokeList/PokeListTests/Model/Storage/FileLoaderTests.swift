//
//  FileLoaderTests:.swift
//  PokeListTests
//
//  Created by Emerson Victor on 19/09/19.
//  Copyright © 2019 emer. All rights reserved.
//

import XCTest

class FileLoaderTests: XCTestCase {
        
    // MARK: - Variables
    var fileLoader = FileLoader()
    var pokelist: [Pokemon]!
    
    // MARK: - SetUp
    override func setUp() {
        super.setUp()
        
        /// Arrange
        /// File loader
        let testBundle = Bundle(for: type(of: self))
        fileLoader.jsonPath = testBundle.path(forResource: "TestPokelist", ofType: "json")
        
        /// Pokelist
        self.pokelist = [
        Pokemon(id: 132, name: "Ditto", hp: 48, attack: 48, defense: 48, types: ["normal"]),
        Pokemon(id: 1, name: "Bulbasaur", hp: 45, attack: 49, defense: 49, types: ["poison", "grass"])
        ]
    }
    
    // GOOD: - Get Pokelist from Json
    func testGetPokeList() {
        do {
            /// Arrange
            let testBundle = Bundle(for: type(of: self))
            let pokelistPath = testBundle.path(forResource: "TestPokelist", ofType: "json")
            let pokelistData: Data = try Data(contentsOf: URL(fileURLWithPath: pokelistPath!))
            
            /// Act
            let pokelistFromJson = try JSONDecoder().decode([Pokemon].self, from: pokelistData)
            let pokelist = self.fileLoader.getPokelist()
            
            /// Assert
            XCTAssertEqual(pokelist, pokelistFromJson, "Pokelist from FileLoader was incorret.")
        } catch {
            XCTAssert(false, "Could not create pokelist from json data.")
        }
    }
    
    // GOOD: - Save Pokelist into Json
    func testSavePokemon() {
        do {
            /// Act
            let pokelistData = try JSONEncoder().encode(self.pokelist)
            let pokelistFromData = try JSONDecoder().decode([Pokemon].self, from: pokelistData)
            
            /// Assert
            
        } catch {
            XCTAssert(false, "Could not update pokelist from an array of Pokemon.")
        }
    }
}
