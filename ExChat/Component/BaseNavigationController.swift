//
//  BaseNavigationController.swift
//  ExChat
//
//  Created by 김종권 on 2021/11/15.
//

import UIKit

class BaseNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBarStyle()
    }
    
    private func setupNavigationBarStyle() {
        let mainColor = UIColor.label
        navigationBar.tintColor = mainColor
        navigationBar.prefersLargeTitles = true
        navigationBar.titleTextAttributes = [.foregroundColor: mainColor]
    }
}
