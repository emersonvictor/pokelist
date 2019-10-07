//
//  Pokemon+CoreDataClass.swift
//  PokeList
//
//  Created by Emerson Victor on 01/10/19.
//  Copyright © 2019 emer. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Pokemon)
public class Pokemon: NSManagedObject {
    convenience init(id: Int16, name: String, hp: Int16, attack: Int16, defense: Int16, imageLink: String, isFavorite: Bool) {
        
        // CoreData context
        let context = CoreDataStack.context
        
        // Use default initializer to create an instace
        let description = NSEntityDescription.entity(forEntityName: "Pokemon", in: context)
        self.init(entity: description!, insertInto: context)
        
        // Set attributes
        self.id = id
        self.name = name
        self.hp = hp
        self.attack = attack
        self.defense = defense
        self.imageLink = imageLink
        self.isFavorite = isFavorite
    }
}
