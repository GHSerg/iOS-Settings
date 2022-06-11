//
//  AppDelegate.swift
//  HW15
//
//  Created by Sergey Bodnar on 11.06.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow()
        
        window.rootViewController = SettingsViewController()
        window.makeKeyAndVisible()
        
        self.window = window
        
        return true
    }
}

