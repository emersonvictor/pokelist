//
//  CoreDataManager.swift
//  PokeList
//
//  Created by Emerson Victor on 01/10/19.
//  Copyright © 2019 emer. All rights reserved.
//

import CoreData

class CoreDataManager {
    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentCloudKitContainer = {
        let container = NSPersistentCloudKitContainer(name: "PokeList")
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        
        // Initialize the CloudKit schema
        do {
            try container.initializeCloudKitSchema()
        } catch {
            print("Unable to initialize CloudKit schema: \(error.localizedDescription)")
        }
        
        return container
    }()
    
    // MARK: - Core Data context
    func getContext() -> NSManagedObjectContext {
        return self.persistentContainer.viewContext
    }
    
    // MARK: - Core Data Saving support
    func saveContext () {
        let context = self.persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
