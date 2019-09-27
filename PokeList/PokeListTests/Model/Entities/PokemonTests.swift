//
//  PokemonTests.swift
//  PokeListTests
//
//  Created by Emerson Victor on 12/09/19.
//  Copyright © 2019 emer. All rights reserved.
//

import XCTest

class PokemonTests: XCTestCase {
    
    // MARK: - Variables
    var ditto: Pokemon!
    var bulbasaur: Pokemon!

    // MARK: - SetUp
    override func setUp() {
        super.setUp()
        
        /// Arrange
        self.ditto = Pokemon(id: 132, name: "Ditto", hp: 48, attack: 48, defense: 48, types: [PokeType(name: "normal")])
        self.bulbasaur = Pokemon(id: 1, name: "Bulbasaur", hp: 45, attack: 49, defense: 49, types: [PokeType(name: "poison"), PokeType(name: "grass")])
    }
    
    // MARK: - Initializer
    // GOOD: - Initialize a Pokemon
    func testCorrectInitializer() {
        /// Assert
        XCTAssertEqual(self.ditto.id, 132)
        XCTAssertEqual(self.ditto.name, "Ditto")
        XCTAssertEqual(self.ditto.hp, 48)
        XCTAssertEqual(self.ditto.attack, 48)
        XCTAssertEqual(self.ditto.defense, 48)
        XCTAssertEqual(self.ditto.types, [PokeType(name: "normal")])
    }
    
    // BAD: - Initialize a Pokemon and compare to other attributes
    func testIncorrectInitializer() {
        /// Assert
        XCTAssertNotEqual(self.ditto.id, self.bulbasaur.id)
        XCTAssertNotEqual(self.ditto.name, self.bulbasaur.name)
        XCTAssertNotEqual(self.ditto.hp, self.bulbasaur.hp)
        XCTAssertNotEqual(self.ditto.attack, self.bulbasaur.attack)
        XCTAssertNotEqual(self.ditto.defense, self.bulbasaur.defense)
        XCTAssertNotEqual(self.ditto.types, self.bulbasaur.types)
    }
    
    // MARK: - Json initializer
    // GOOD: Initialize Pokemon from json
    func testCorrectConvenienceInitializerFromJson() {
        do {
            /// Arrange
            let testBundle = Bundle(for: type(of: self))
            let pokemonPath = testBundle.path(forResource: "TestPokemon", ofType: "json")
            let pokemonData: Data = try Data(contentsOf: URL(fileURLWithPath: pokemonPath!))
            
            /// Act
            let pokemonFromJson = try JSONDecoder().decode(Pokemon.self, from: pokemonData)

            /// Assert
            XCTAssertEqual(self.bulbasaur, pokemonFromJson, "Initialized pokemon was incorret.")
        } catch {
            XCTAssert(false, "Could not create pokemon from json data.")
        }
    }
    
    // BAD: Initialize Pokemon from incorrect json
    func testIncorrectConvenienceInitializerFromJson() {
        do {
            /// Arrange
            let testBundle = Bundle(for: type(of: self))
            let pokemonPath = testBundle.path(forResource: "TestErrorPokemon", ofType: "json")
            let pokemonData: Data = try Data(contentsOf: URL(fileURLWithPath: pokemonPath!))
            
            /// Act
            let pokemonFromJson = try JSONDecoder().decode(Pokemon.self, from: pokemonData)

            /// Assert
            XCTAssertNotEqual(self.bulbasaur, pokemonFromJson, "Initialized pokemon was correct.")
        } catch {
            XCTAssert(true, "Pokemon created from incorrent json data.")
        }
    }
}
