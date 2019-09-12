//
//  Type.swift
//  PokéList
//
//  Created by Emerson Victor on 11/09/19.
//  Copyright © 2019 emer. All rights reserved.
//

import Foundation
import UIKit

class Type: Equatable {
    let name: String
    let color: UIColor?
    
    init(name: String) {
        self.name = name
        if let color = TypeColor.types[name] {
            self.color = color
        } else {
            self.color = nil
        }
    }
    
    static func == (lhs: Type, rhs: Type) -> Bool {
        return lhs.name == rhs.name
    }
}
