//
//  SceneDelegate.swift
//  PokeList
//
//  Created by Emerson Victor on 30/09/19.
//  Copyright © 2019 emer. All rights reserved.
//

import UIKit
import SwiftUI
import CoreData

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
//            window.rootViewController = UIHostingController(rootView: PokeListView())
            let main = UIStoryboard(name: "Main", bundle: nil)
            window.rootViewController = main.instantiateInitialViewController()
            self.window = window
            window.makeKeyAndVisible()
        }
        
    }
    
    // MARK: - Scene Lifecycle
    func sceneDidDisconnect(_ scene: UIScene) {
        print("Called as the scene is being released by the system.")
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        PokeApiManager.shared.getPokemonList()
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        print("Called when the scene will move from an active state to an inactive state.")
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        print("Called as the scene transitions from the background to the foreground.")
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        CoreDataStack.saveContext()
        print("Called as the scene transitions from the foreground to the background.")
    }
    
    
}

