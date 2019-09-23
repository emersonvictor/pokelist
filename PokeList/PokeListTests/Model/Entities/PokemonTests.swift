//
//  PokemonTests.swift
//  PokeListTests
//
//  Created by Emerson Victor on 12/09/19.
//  Copyright © 2019 emer. All rights reserved.
//

import XCTest

class PokemonTests: XCTestCase {

    // Pokemon
    var ditto: Pokemon!
    var bullbasaur: Pokemon!
    
    // SetUp
    override func setUp() {
        super.setUp()
        
        self.ditto = Pokemon(id: 132, name: "Ditto", hp: 48, attack: 48, defense: 48, types: ["normal"])
        self.bullbasaur = Pokemon(id: 1, name: "Bulbasaur", hp: 45, attack: 49, defense: 49, types: ["poison", "grass"])
    }
    
    // MARK: - Initializer
    func testCorrectInitializer() {
        XCTAssertEqual(self.ditto.id, 132)
        XCTAssertEqual(self.ditto.name, "Ditto")
        XCTAssertEqual(self.ditto.hp, 48)
        XCTAssertEqual(self.ditto.attack, 48)
        XCTAssertEqual(self.ditto.defense, 48)
        XCTAssertEqual(self.ditto.types, [PokeType(name: "normal")])
    }
    
    func testIncorrectInitializer() {
        XCTAssertNotEqual(self.ditto.id, self.bullbasaur.id)
        XCTAssertNotEqual(self.ditto.name, self.bullbasaur.name)
        XCTAssertNotEqual(self.ditto.hp, self.bullbasaur.hp)
        XCTAssertNotEqual(self.ditto.attack, self.bullbasaur.attack)
        XCTAssertNotEqual(self.ditto.defense, self.bullbasaur.defense)
        XCTAssertNotEqual(self.ditto.types, self.bullbasaur.types)
    }
    
    // MARK: - Json initializer
    func testCorrectConvenienceInitializerFromJson() {
        do {
            let testBundle = Bundle(for: type(of: self))
            let pokemonPath = testBundle.path(forResource: "TestPokemon", ofType: "json")
            let pokemonData: Data = try Data(contentsOf: URL(fileURLWithPath: pokemonPath!))
            let pokemonFromJson = try JSONDecoder().decode(Pokemon.self, from: pokemonData)

            XCTAssertEqual(self.bullbasaur, pokemonFromJson, "Initialized pokemon was incorret.")
        } catch {
            XCTAssert(false, "Could not create pokemon from json data.")
        }
    }
    
    func testIncorrectConvenienceInitializerFromJson() {
        do {
            let testBundle = Bundle(for: type(of: self))
            let pokemonPath = testBundle.path(forResource: "TestErrorPokemon", ofType: "json")
            let pokemonData: Data = try Data(contentsOf: URL(fileURLWithPath: pokemonPath!))
            let pokemonFromJson = try JSONDecoder().decode(Pokemon.self, from: pokemonData)

            XCTAssertNotEqual(self.bullbasaur, pokemonFromJson, "Initialized pokemon was correct.")
        } catch {
            XCTAssert(true, "Pokemon created from incorrent json data.")
        }
    }
}
