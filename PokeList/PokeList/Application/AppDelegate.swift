//
//  AppDelegate.swift
//  PokeList
//
//  Created by Emerson Victor on 30/09/19.
//  Copyright © 2019 emer. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        return true
    }

    // MARK: - UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }
    
    // MARK: - Core Data stack
    var persistentContainer: NSPersistentCloudKitContainer = {
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
}

