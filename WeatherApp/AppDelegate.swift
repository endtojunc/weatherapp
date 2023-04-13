//
//  AppDelegate.swift
//  WeatherApp
//
//  Created by Teh Ting Feng on 8/4/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    private let container: AppContainer = MainContainer()
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let window = UIWindow()
        window.rootViewController = container.resolve(serviceType: HomeViewController.self)
        
        self.window = window
        self.window?.makeKeyAndVisible()
        return true
    }
}

