//
//  SceneDelegate.swift
//  PokeList
//
//  Created by Emerson Victor on 30/09/19.
//  Copyright © 2019 emer. All rights reserved.
//

import UIKit
import SnapKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let pokelistController = PokelistController()
        let navigationController = UINavigationController(rootViewController: pokelistController)
        
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        if let window = self.window {
            window.rootViewController = navigationController
            window.makeKeyAndVisible()
            window.windowScene = windowScene
        }
    }
    
    // MARK: - Scene Lifecycle
    func sceneDidDisconnect(_ scene: UIScene) {
        print("Called as the scene is being released by the system.")
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        print("Called when the scene will move from an active state to an inactive state.")
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        print("Called as the scene transitions from the background to the foreground.")
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        print("Called as the scene transitions from the foreground to the background.")
    }
}

