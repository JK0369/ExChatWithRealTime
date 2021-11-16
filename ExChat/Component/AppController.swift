//
//  AppController.swift
//  ExChat
//
//  Created by 김종권 on 2021/11/16.
//

import Foundation
import Firebase
import UIKit

final class AppController {
    static let shared = AppController()
    private var window: UIWindow!
    private var rootViewController: UIViewController? {
        didSet {
            window.rootViewController = rootViewController
        }
    }
    
    init() {
        FirebaseApp.configure()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(checkSignIn),
                                               name: .AuthStateDidChange,
                                               object: nil)
    }
    
    func show(in window: UIWindow?) {
        guard let window = window else {
            fatalError("Cannot layout app with a nil window.")
        }
        self.window = window
        window.tintColor = .primary
        window.backgroundColor = .systemBackground
        checkSignIn()
        window.makeKeyAndVisible()
    }

    @objc private func checkSignIn() {
        if let user = Auth.auth().currentUser {
            setCahnnelScene(with: user)
        } else {
            setLoginScene()
        }
    }
    
    private func setCahnnelScene(with user: User) {
        let channelVC = ChannelVC(currentUser: user)
        rootViewController = BaseNavigationController(rootViewController: channelVC)
    }
    
    private func setLoginScene() {
        rootViewController = BaseNavigationController(rootViewController: LoginVC())
    }
}
