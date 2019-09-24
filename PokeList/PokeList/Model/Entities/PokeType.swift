//
//  Type.swift
//  PokéList
//
//  Created by Emerson Victor on 11/09/19.
//  Copyright © 2019 emer. All rights reserved.
//

import Foundation
import UIKit

class PokeType {
    let name: String
    let color: UIColor
    
    init(name: String) {
        self.name = name
        self.color = TypeColor.types[name] ?? UIColor.clear
    }
}

// MARK: - Encodable protocol
extension PokeType: Encodable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.name, forKey: .name)
    }
   
   enum CodingKeys: String, CodingKey {
       case name
   }
}

// MARK: - Hashable protocol
extension PokeType: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.name)
    }
}

// MARK: - Equatable protocol
extension PokeType: Equatable {
    static func == (lhs: PokeType, rhs: PokeType) -> Bool {
        return lhs.name == rhs.name
    }
}
