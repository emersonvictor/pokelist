//
//  Type.swift
//  PokéList
//
//  Created by Emerson Victor on 11/09/19.
//  Copyright © 2019 emer. All rights reserved.
//

import Foundation
import UIKit

class PokeType: Equatable {
    let name: String
    let color: UIColor?
    
    /// Create Pokémon type from name
    ///
    /// - Parameter name: Pókemon type name
    init(name: String) {
        self.name = name
        if let color = TypeColor.types[name] {
            self.color = color
        } else {
            self.color = nil
        }
    }
    
    /// Check equality between two instaces of a Pokémon type
    ///
    /// - Parameters:
    ///   - lhs: Pókemon type object
    ///   - rhs: Pókemon type object
    /// - Returns: Booleaon representing if the two Pokémon type object has the same name
    static func == (lhs: PokeType, rhs: PokeType) -> Bool {
        return lhs.name == rhs.name
    }
}
