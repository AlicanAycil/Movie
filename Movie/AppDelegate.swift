//
//  AppDelegate.swift
//  Movie
//
//  Created by Alican Aycil on 14.01.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let rootViewController = NavigationController (
            rootViewController: MoviesViewController.builder()
        )
        let frame = UIScreen.main.bounds
        let window = UIWindow(frame: frame)
        
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        self.window = window
        
        return true
    }
}

