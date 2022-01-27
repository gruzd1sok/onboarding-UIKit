//
//  AppDelegate.swift
//  skiTourism
//
//  Created by Илья Груздев on 26.01.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = OnboardingViewController()
        window.makeKeyAndVisible()
        self.window = window
        
        // Override point for customization after application launch.
        return true
    }

}


