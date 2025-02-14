//
//  SceneDelegate.swift
//  Fit Tip App
//
//  Created by Atheer Othman on 17/04/1443 AH.
//

import UIKit
import FirebaseAuth

var gloabalWindow: UIWindow?

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let sceneWindow = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: sceneWindow)
        gloabalWindow = window
        window?.rootViewController = LogoViewController()
        window?.makeKeyAndVisible()
       
        if Auth.auth().currentUser != nil{
            let userNetworking = UserNetworking()
            let uid = Auth.auth().currentUser!.uid
            userNetworking.setupUserInfo(uid) { (isActive) in
                if isActive {
                    self.window?.rootViewController = TabBar()
                    self.window?.makeKeyAndVisible()
                }else{
                    let controller = SignInViewController()
                    self.window?.rootViewController = controller
                    self.window?.makeKeyAndVisible()
                }
            }
        }else{
            window?.rootViewController = WelcomeViewController()
            window?.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

