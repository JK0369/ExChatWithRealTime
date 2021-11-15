//
//  AppDelegate.swift
//  ExChat
//
//  Created by 김종권 on 2021/11/15.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = BaseNavigationController(rootViewController: LoginVC())
        window?.makeKeyAndVisible()
        
        return true
    }
}

