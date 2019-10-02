//
//  Pokemon+CoreDataProperties.swift
//  PokeList
//
//  Created by Emerson Victor on 01/10/19.
//  Copyright © 2019 emer. All rights reserved.
//
//

import Foundation
import CoreData


extension Pokemon {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Pokemon> {
        return NSFetchRequest<Pokemon>(entityName: "Pokemon")
    }

    @NSManaged public var id: Int16
    @NSManaged public var name: String?
    @NSManaged public var hp: Int16
    @NSManaged public var attack: Int16
    @NSManaged public var defense: Int16
    @NSManaged public var imageLink: String?
    @NSManaged public var isFavorite: Bool
    @NSManaged public var types: NSSet?

}

// MARK: Generated accessors for types
extension Pokemon {

    @objc(addTypesObject:)
    @NSManaged public func addToTypes(_ value: PokeType)

    @objc(removeTypesObject:)
    @NSManaged public func removeFromTypes(_ value: PokeType)

    @objc(addTypes:)
    @NSManaged public func addToTypes(_ values: NSSet)

    @objc(removeTypes:)
    @NSManaged public func removeFromTypes(_ values: NSSet)

}
