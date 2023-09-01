//
//  SceneDelegate.swift
//  Netorking
//
//  Created by MAC on 30/08/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
     
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        print("sceneDidBecomeActive")

    }

    func sceneWillResignActive(_ scene: UIScene) {
        print("sceneWillResignActive")

    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        print("sceneWillEnterForeground")

    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        print("sceneDidEnterBackground")

    }


}

