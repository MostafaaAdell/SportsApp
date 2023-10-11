//
//  SplashVC.swift
//  SportsApp
//
//  Created by Abdallah on 06/10/2023.
//

import UIKit
import Lottie

class SplashVC: UIViewController {
    
    let myView : LottieAnimationView = .init()
    let myView2 : LottieAnimationView = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myView.animation = .named("Animation4")
        myView.loopMode = .loop
        myView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        myView.center = view.center
        view = myView
        myView.contentMode = .scaleAspectFit
        myView.play()
        myView2.animation = .named("Animation7")
        myView2.loopMode = .loop
        myView2.frame = CGRect(x: 0, y: 0, width: 600, height: 250)
        myView2.center = CGPointMake(myView.frame.maxX/1.25, myView.frame.height/0.16)
        myView.addSubview(myView2)
        myView2.contentMode = .scaleAspectFit
        
        myView2.play()
        myView.backgroundColor = .black
        
        Timer.scheduledTimer(timeInterval: 9, target: self, selector: #selector(showFirstView), userInfo: nil, repeats: false)
    }
    
    @objc func showFirstView(){
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
                .font: UIFont.systemFont(ofSize: 25, weight: .bold) // Set the font and size
            ]
            navigationBarAppearance.titleTextAttributes = titleTextAttributes


        }
        
        let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate
        sceneDelegate?.window?.rootViewController = rootViewController
        sceneDelegate?.window?.makeKeyAndVisible()
       
        
        
    }
    
}




