//
//  FileLoaderTests:.swift
//  PokeListTests
//
//  Created by Emerson Victor on 19/09/19.
//  Copyright © 2019 emer. All rights reserved.
//

import XCTest

class FileLoaderTests: XCTestCase {
        
    var fileLoader = FileLoader()
    
    override func setUp() {
        super.setUp()
        
        let testBundle = Bundle(for: type(of: self))
        fileLoader.jsonPath = testBundle.path(forResource: "TestPokelist", ofType: "json")
    }
    
    func testGetPokeList() {
        do {
            let testBundle = Bundle(for: type(of: self))
            let pokelistPath = testBundle.path(forResource: "TestPokelist", ofType: "json")
            let pokelistData: Data = try Data(contentsOf: URL(fileURLWithPath: pokelistPath!))
            
            let pokelistFromJson = try JSONDecoder().decode([Pokemon].self, from: pokelistData)
            let pokelist = self.fileLoader.getPokelist()
            
            XCTAssertEqual(pokelist, pokelistFromJson, "Pokelist from FileLoader was incorret.")
        } catch {
            XCTAssert(false, "Could not create pokelist from json data.")
        }
    }
    
    func testSavePokemon() {
        
    }
}

//
//static func save(pokemon: Pokemon) -> Bool {
//    return true
//}
//
