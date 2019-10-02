//
//  PokeListVM.swift
//  PokeList
//
//  Created by Emerson Victor on 01/10/19.
//  Copyright © 2019 emer. All rights reserved.
//

import CoreData

class PokeListVM {
    
    // MARK: - Properties
    let context = CoreDataManager().getContext()
    var pokelist: [Pokemon]
    
    // MARK: - Initializer
    init() {
        self.pokelist = []
        
        // Fetch request
        let fetchRequest = NSFetchRequest<Pokemon>(entityName: "Pokemon")
        fetchRequest.predicate = NSPredicate(format: "isFavorite == true")
        fetchRequest.sortDescriptors = [
            NSSortDescriptor(key: "id", ascending: true)
        ]
        
        // Perform fetch
        do {
            let pokelist = try self.context.fetch(fetchRequest)
            self.pokelist = pokelist
        } catch {
            print(error)
            self.pokelist = []
        }
    }
}
