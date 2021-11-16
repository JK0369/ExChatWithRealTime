//
//  LoginVC.swift
//  ExChat
//
//  Created by 김종권 on 2021/11/15.
//

import UIKit
import SnapKit
import FirebaseAuth

class LoginVC: BaseViewController {
    
    lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = .label
        textField.placeholder = "이름 입력"
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .no
        textField.returnKeyType = .done
        textField.delegate = self
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그인", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.gray, for: .disabled)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.isEnabled = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(loginButton)
        view.addSubview(nameTextField)
        
        loginButton.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
        }
        
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(-56)
            make.centerX.equalToSuperview()
        }
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        nameTextField.becomeFirstResponder()
    }
    
    @objc func didTapButton() {
        guard let name = nameTextField.text else { return }
        UserDefaultManager.displayName = name
        Auth.auth().signInAnonymously()
    }
}

extension LoginVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Range(range, in: text): 갱신된 range값과 기존 string을 가지고 객체 변환: NSRange > Range
        guard let oldString = textField.text, let newRange = Range(range, in: oldString) else { return true }

        // range값과 inputString을 가지고 replacingCharacters(in:with:)을 이용하여 string 업데이트
        let inputString = string.trimmingCharacters(in: .whitespacesAndNewlines)
        let newString = oldString.replacingCharacters(in: newRange, with: inputString)
            .trimmingCharacters(in: .whitespacesAndNewlines)
        
        loginButton.isEnabled = !newString.isEmpty

        return true
    }
}
