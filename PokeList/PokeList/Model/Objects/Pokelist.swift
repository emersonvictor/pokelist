//
//  Pokelist.swift
//  PokeList
//
//  Created by Emerson Victor on 23/11/19.
//  Copyright © 2019 emer. All rights reserved.
//

import RealmSwift

final class Pokelist: Object {
    let pokemon = List<Pokemon>()
}

