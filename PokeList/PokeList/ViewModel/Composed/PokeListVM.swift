//
//  PokeListVM.swift
//  PokeList
//
//  Created by Emerson Victor on 01/10/19.
//  Copyright © 2019 emer. All rights reserved.
//

import CoreData

class PokeListVM: NSObject {
    
    // MARK: - Properties
    let context = CoreDataStack.context
    let pokelist: [Pokemon]
    
    // MARK: - Initializer
    override init() {
        // Fetch request
        let fetchRequest: NSFetchRequest<Pokemon> = Pokemon.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "isFavorite == true")
        fetchRequest.sortDescriptors = [
            NSSortDescriptor(key: "id", ascending: true)
        ]
        
        // Perform fetch
        do {
            self.pokelist = try fetchRequest.execute()
        } catch {
            print(error)
            self.pokelist = []
        }
        
        // Call NSObject initializer
        super.init()
    }
}
