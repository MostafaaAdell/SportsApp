//
//  SceneDelegate.swift
//  SportsApp
//
//  Created by Mustafa on 27/09/2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        //guard let _ = (scene as? UIWindowScene) else { return }
        
        
        guard let windowScene = scene as? UIWindowScene else { return }
           
           // Create a new UIWindow with the provided window scene
           let window = UIWindow(windowScene: windowScene)
        customNavigationCOntroller(window: window)
           
                  
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

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
    
    
    func customNavigationCOntroller(window:UIWindow){
        
        
        // Access the main storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // Instantiate the initial view controller from the storyboard
        let rootViewController = storyboard.instantiateInitialViewController()
           if let navigationController = rootViewController as? UINavigationController {
            let navigationBarAppearance = navigationController.navigationBar
 
            navigationBarAppearance.tintColor = UIColor.black
            navigationBarAppearance.setBackgroundImage(UIImage(), for: .default)
            navigationBarAppearance.shadowImage = UIImage()
            navigationBarAppearance.isTranslucent = true
            

            
            // Set the font and text attributes for the navigation bar title
            let titleTextAttributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor.black, // Set the text color to white
                .font: UIFont.systemFont(ofSize: 17, weight: .bold) // Set the font and size
            ]
          
            navigationBarAppearance.titleTextAttributes = titleTextAttributes
        }
        
        // Set the root view controller of the window
        window.rootViewController = rootViewController
        
        // Make the window key and visible
        window.makeKeyAndVisible()
        
        // Assign the window to the scene's window property
        self.window = window
    }


}
