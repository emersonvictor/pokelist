//
//  Pokemon.swift
//  PokeList
//
//  Created by Emerson Victor on 23/11/19.
//  Copyright © 2019 emer. All rights reserved.
//

import RealmSwift

final class Pokemon: Object {
    typealias PokemonTypeValue = String
    
    @objc dynamic var id: Int = 0
    @objc dynamic var image: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic private var primaryTypeValue: PokemonTypeValue = ""
    var primaryType: PokemonType {
        get {
            return PokemonType(rawValue: self.primaryTypeValue)!
        }
        
        set(type) {
            self.primaryTypeValue = type.rawValue
        }
    }
    @objc dynamic private var secondaryTypeValue: PokemonTypeValue? = nil
    var secondaryType: PokemonType? {
        get {
            if let type = self.secondaryTypeValue {
                return PokemonType(rawValue: type)!
            }
            return nil
        }
        
        set(type) {
            if let type = type {
                self.secondaryTypeValue = type.rawValue
                return
            }
            self.secondaryTypeValue = nil
        }
    }
    @objc dynamic var hp: Int = 0
    @objc dynamic var attack: Int = 0
    @objc dynamic var defense: Int = 0
    
    // Set primary key
    override static func primaryKey() -> String? {
        return "id"
    }
    
    // Set ignored properties
    override static func ignoredProperties() -> [String] {
        return ["primaryType", "secondarytype"]
    }
}

