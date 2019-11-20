//
//  SpriteDTO.swift
//  PokeList
//
//  Created by Emerson Victor on 19/11/19.
//  Copyright © 2019 emer. All rights reserved.
//

import Foundation

struct SpriteDTO: Codable {
    let frontDefault: String

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}
