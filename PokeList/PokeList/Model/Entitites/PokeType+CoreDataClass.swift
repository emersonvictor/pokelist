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
        // Use default initializer to create an instace
        self.init(context: CoreDataManager().getContext())
        
        // Set attributes
        self.name = name
    
    }
}
