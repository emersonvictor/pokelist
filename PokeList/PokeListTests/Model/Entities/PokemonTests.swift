//
//  PokemonTests.swift
//  PokeListTests
//
//  Created by Emerson Victor on 12/09/19.
//  Copyright © 2019 emer. All rights reserved.
//

import XCTest

class PokemonTests: XCTestCase {

    func testInitilizerWithoutType2() {
        let json: [String: Any?] = [
            "id": 132,
            "name": "Ditto",
            "hp": 48,
            "attack": 48,
            "defense": 48,
            "type1": "normal",
            "type2": nil
        ]
        
        let pokemon = Pokemon(with: json)
        
        XCTAssertEqual(pokemon.id, json["id"] as! Int, "Pokemon id initialized was incorret")
        XCTAssertEqual(pokemon.name, json["name"] as! String, "Pokemon name initialized was incorret")
        XCTAssertEqual(pokemon.hp, json["hp"] as! Int, "Pokemon hp initialized was incorret")
        XCTAssertEqual(pokemon.attack, json["attack"] as! Int, "Pokemon attack initialized was incorret")
        XCTAssertEqual(pokemon.defense, json["defense"] as! Int, "Pokemon defense initialized was incorret")
        XCTAssertEqual(pokemon.type1, Type(name: json["type1"] as! String), "Pokemon type1 initialized was incorret")
        XCTAssertEqual(pokemon.type2, nil, "Pokemon type2 initialized was incorret")
    }
    
    func testInitilizerWithType2() {
        let json: [String: Any?] = [
            "id": 132,
            "name": "Ditto",
            "hp": 48,
            "attack": 48,
            "defense": 48,
            "type1": "normal",
            "type2": "fire"
        ]
        
        let pokemon = Pokemon(with: json)
        
        XCTAssertEqual(pokemon.id, json["id"] as! Int, "Pokemon id initialized was incorret")
        XCTAssertEqual(pokemon.name, json["name"] as! String, "Pokemon name initialized was incorret")
        XCTAssertEqual(pokemon.hp, json["hp"] as! Int, "Pokemon hp initialized was incorret")
        XCTAssertEqual(pokemon.attack, json["attack"] as! Int, "Pokemon attack initialized was incorret")
        XCTAssertEqual(pokemon.defense, json["defense"] as! Int, "Pokemon defense initialized was incorret")
        XCTAssertEqual(pokemon.type1, Type(name: json["type1"] as! String), "Pokemon type1 initialized was incorret")
        XCTAssertEqual(pokemon.type2, Type(name: json["type2"] as! String), "Pokemon type2 initialized was incorret")
    }
}
