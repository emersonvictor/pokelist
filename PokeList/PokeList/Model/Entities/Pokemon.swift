//
//  Pokemon.swift
//  PokéList
//
//  Created by Emerson Victor on 11/09/19.
//  Copyright © 2019 emer. All rights reserved.
//

import Foundation

class Pokemon: Codable {
    let id: Int
    let name: String
    let hp: Int
    let attack: Int
    let defense: Int
    let types: Set<PokeType>

    init(id: Int, name: String, hp: Int, attack: Int, defense: Int, types: [PokeType]) {
        self.id = id
        self.name = name
        self.hp = hp
        self.attack = attack
        self.defense = defense
        self.types = Set(types)
    }
    
    required convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Pokemon.CodingKeys.self)

        let id = try container.decode(Int.self, forKey: .id)
        let name = try container.decode(String.self, forKey: .name)
        let hp = try container.decode(Int.self, forKey: .hp)
        let attack = try container.decode(Int.self, forKey: .attack)
        let defense = try container.decode(Int.self, forKey: .defense)
        let types = try container.decode([PokeType].self, forKey: .types)

        self.init(id: id, name: name, hp: hp, attack: attack, defense: defense, types: types)
    }
}

// MARK: - Equatable protocol
extension Pokemon: Equatable {
    static func == (lhs: Pokemon, rhs: Pokemon) -> Bool {
        return lhs.id == rhs.id &&
               lhs.name == rhs.name &&
               lhs.hp == rhs.hp &&
               lhs.attack == rhs.defense &&
               lhs.types == rhs.types
    }
}
