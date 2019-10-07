//
//  SearchVM.swift
//  PokeList
//
//  Created by Emerson Victor on 01/10/19.
//  Copyright © 2019 emer. All rights reserved.
//

import CoreData

class SearchVM {
    let context = CoreDataStack.context
    
    func getPokemonList() -> [Pokemon] {
        // Fetch request
        let fetchRequest: NSFetchRequest<Pokemon> = Pokemon.fetchRequest()
        fetchRequest.sortDescriptors = [
            NSSortDescriptor(key: "id", ascending: true)
        ]
        
        // Perform fetch
        do {
            return try fetchRequest.execute()
        } catch {
            print(error)
            return []
        }
    }
    
    func searchPokemon(withName name: String) -> [Pokemon] {
        // Fetch request
        let fetchRequest: NSFetchRequest<Pokemon> = Pokemon.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "name CONTAINS[cd]", name)
        fetchRequest.sortDescriptors = [
            NSSortDescriptor(key: "id", ascending: true)
        ]
        
        // Perform fetch
        do {
            return try fetchRequest.execute()
        } catch {
            print(error)
            return []
        }
    }
}
