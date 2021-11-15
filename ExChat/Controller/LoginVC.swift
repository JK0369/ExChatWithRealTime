//
//  LoginVC.swift
//  ExChat
//
//  Created by 김종권 on 2021/11/15.
//

import UIKit
import SnapKit

class LoginVC: BaseViewController {
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그인", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
        }
    }
    
    @objc func didTapButton() {
        navigationController?.setViewControllers([ChannelVC()], animated: true)
    }
}
