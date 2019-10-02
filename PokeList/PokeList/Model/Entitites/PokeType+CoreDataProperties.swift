//
//  PokeType+CoreDataProperties.swift
//  PokeList
//
//  Created by Emerson Victor on 01/10/19.
//  Copyright © 2019 emer. All rights reserved.
//
//

import Foundation
import CoreData


extension PokeType {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PokeType> {
        return NSFetchRequest<PokeType>(entityName: "PokeType")
    }

    @NSManaged public var name: String?
    @NSManaged public var pokemon: NSSet?

}

// MARK: Generated accessors for pokemon
extension PokeType {

    @objc(addPokemonObject:)
    @NSManaged public func addToPokemon(_ value: Pokemon)

    @objc(removePokemonObject:)
    @NSManaged public func removeFromPokemon(_ value: Pokemon)

    @objc(addPokemon:)
    @NSManaged public func addToPokemon(_ values: NSSet)

    @objc(removePokemon:)
    @NSManaged public func removeFromPokemon(_ values: NSSet)

}
