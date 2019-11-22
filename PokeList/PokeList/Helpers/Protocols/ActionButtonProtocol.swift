//
//  ActionButtonProtocol.swift
//  PokeList
//
//  Created by Emerson Victor on 21/11/19.
//  Copyright © 2019 emer. All rights reserved.
//

import UIKit

protocol ActionButtonDelegate {
    func didSelectPokemon(withId id: Int)
}
