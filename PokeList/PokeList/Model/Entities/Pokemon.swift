//
//  Pokemon.swift
//  PokéList
//
//  Created by Emerson Victor on 11/09/19.
//  Copyright © 2019 emer. All rights reserved.
//

import Foundation

class Pokemon {
    let id: Int
    let name: String
    let hp: Int
    let attack: Int
    let defense: Int
    let type1: Type
    let type2: Type?
    
    init(with json: [String: Any?]) {
        self.id = json["id"] as! Int
        self.name = json["name"] as! String
        self.hp = json["hp"] as! Int
        self.attack = json["attack"] as! Int
        self.defense = json["defense"] as! Int
        self.type1 = Type(name: json["type1"] as! String)
        
        if let type2 = json["type2"] as! String? {
            self.type2 = Type(name: type2)
        } else {
            self.type2 = nil
        }
    }
}
