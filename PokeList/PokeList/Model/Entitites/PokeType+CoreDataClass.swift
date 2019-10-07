//
//  PokeType+CoreDataClass.swift
//  PokeList
//
//  Created by Emerson Victor on 01/10/19.
//  Copyright © 2019 emer. All rights reserved.
//
//

import Foundation
import CoreData
import UIKit

@objc(PokeType)
public class PokeType: NSManagedObject {
    convenience init(name: String) {
        // CoreData context
        let context = CoreDataStack.context
        
        // Use default initializer to create an instace
        let description = NSEntityDescription.entity(forEntityName: "PokeType", in: context)
        self.init(entity: description!, insertInto: context)
        
        // Set attributes
        self.name = name
    }
}
