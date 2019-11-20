//
//  StatDTO.swift
//  PokeList
//
//  Created by Emerson Victor on 19/11/19.
//  Copyright © 2019 emer. All rights reserved.
//

import Foundation

struct StatDTO: Codable {
    typealias StatInfoDTO = InfoDTO
    
    let baseStat: Int
    let statInfo: StatInfoDTO

    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case statInfo = "stat"
    }
}
