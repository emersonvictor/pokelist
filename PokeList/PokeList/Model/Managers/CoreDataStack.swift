//
//  CoreDataManager.swift
//  PokeList
//
//  Created by Emerson Victor on 01/10/19.
//  Copyright © 2019 emer. All rights reserved.
//

import CoreData
import UIKit

class CoreDataStack {
    // MARK: - Application context
    static var context: NSManagedObjectContext {
        get {
            let appDelegate = (UIApplication.shared.delegate as! AppDelegate)
            return appDelegate.persistentContainer.viewContext
        }
    }
    
    // MARK: - Core Data Saving support
    class func saveContext() {
        if self.context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
