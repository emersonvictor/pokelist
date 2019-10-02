//
//  PokeTypeColor.swift
//  PokeList
//
//  Created by Emerson Victor on 01/10/19.
//  Copyright © 2019 emer. All rights reserved.
//

import Foundation
import UIKit

struct PokeTypeColors {    
    static func getColor(forType type: String) -> UIColor {
        switch type {
            case "normal":   return UIColor(red: 199, green: 185, blue: 75, alpha: 1)
            case "water":    return UIColor(red: 98, green: 127, blue: 193, alpha: 1)
            case "eletric":  return UIColor(red: 239, green: 205, blue: 66, alpha: 1)
            case "fighting": return UIColor(red: 192, green: 81, blue: 40, alpha: 1)
            case "ground":   return UIColor(red: 203, green: 136, blue: 45, alpha: 1)
            case "psychic":  return UIColor(red: 208, green: 80, blue: 203, alpha: 1)
            case "rock":     return UIColor(red: 98, green: 65, blue: 26, alpha: 1)
            case "dark":     return UIColor(red: 39, green: 35, blue: 33, alpha: 1)
            case "steel":    return UIColor(red: 166, green: 166, blue: 177, alpha: 1)
            case "fire":     return UIColor(red: 216, green: 114, blue: 50, alpha: 1)
            case "grass":    return UIColor(red: 121, green: 190, blue: 41, alpha: 1)
            case "ice":      return UIColor(red: 113, green: 220, blue: 229, alpha: 1)
            case "poison":   return UIColor(red: 149, green: 57, blue: 149, alpha: 1)
            case "flying":   return UIColor(red: 76, green: 189, blue: 209, alpha: 1)
            case "bug":      return UIColor(red: 158, green: 173, blue: 29, alpha: 1)
            case "ghost":    return UIColor(red: 106, green: 35, blue: 167, alpha: 1)
            case "dragon":   return UIColor(red: 203, green: 21, blue: 21, alpha: 1)
            case "fairy":    return UIColor(red: 235, green: 146, blue: 156, alpha: 1)
            default:         return UIColor.clear
        }
    }
    
}
