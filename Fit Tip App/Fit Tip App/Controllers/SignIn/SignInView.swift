//
//  SignInView.swift
//  Fit Tip App
//
//  Created by Atheer Othman on 18/04/1443 AH.
//

import UIKit
import SkyFloatingLabelTextField

class SignInView: UIView {
    
    var controller: SignInViewController!
    var emailTextField = SkyFloatingLabelTextField()
    var passwordTextField = SkyFloatingLabelTextField()
    var errorLabel = UILabel()
    
    init(_ controller: SignInViewController) {
        super.init(frame: .zero)
        self.controller = controller
        setupLoginView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLoginView() {
        controller.view.addSubview(self)
        backgroundColor = UIColor(named: "BackgroundColor")
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 8
        layer.shadowRadius = 10
        layer.shadowOpacity = 0.3
        var height: CGFloat = 280
        if controller.view.frame.height > 1000 { height = 600 }
        let constraints = [
            bottomAnchor.constraint(equalTo: controller.view.bottomAnchor, constant: -150),
            leadingAnchor.constraint(equalTo: controller.view.leadingAnchor, constant: 32),
            trailingAnchor.constraint(equalTo: controller.view.trailingAnchor, constant: -32),
            heightAnchor.constraint(equalToConstant: height )
        ]
        NSLayoutConstraint.activate(constraints)
        setupLoginLabel()
        setupEmailTextField()
        setupPasswordTextField()
        setupErrorLabel()
    }
    
    private func setupLoginLabel() {
        let loginLabel = UILabel()
        addSubview(loginLabel)
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        loginLabel.text = NSLocalizedString("sign_in", comment: "")
        loginLabel.textAlignment = .center
        loginLabel.font = UIFont.boldSystemFont(ofSize: 18)
        loginLabel.textColor = ThemeColor.mainColor
        let constraints = [
            loginLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            loginLabel.topAnchor.constraint(equalTo: topAnchor, constant: 32)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupEmailTextField() {
        addSubview(emailTextField)
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.placeholder = NSLocalizedString("email", comment: "")
        emailTextField.delegate = controller
        emailTextField.font = UIFont.boldSystemFont(ofSize: 14)
        emailTextField.selectedLineColor = ThemeColor.mainColor
        emailTextField.selectedTitleColor = ThemeColor.mainColor
        emailTextField.lineColor = .lightGray
        emailTextField.autocapitalizationType = .none
        emailTextField.autocorrectionType = .no
        emailTextField.textContentType = .oneTimeCode
        let constraints = [
            emailTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            emailTextField.topAnchor.constraint(equalTo: topAnchor, constant: 64),
            emailTextField.widthAnchor.constraint(equalToConstant: controller.view.frame.width - 120),
            emailTextField.heightAnchor.constraint(equalToConstant: 40)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupPasswordTextField() {
        addSubview(passwordTextField)
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.placeholder = NSLocalizedString("password", comment: "")
        passwordTextField.delegate = controller
        passwordTextField.font = UIFont.boldSystemFont(ofSize: 14)
        passwordTextField.selectedLineColor = ThemeColor.mainColor
        passwordTextField.selectedTitleColor = ThemeColor.mainColor
        passwordTextField.lineColor = .lightGray
        passwordTextField.autocorrectionType = .no
        passwordTextField.isSecureTextEntry = true
        passwordTextField.textContentType = .oneTimeCode
        let constraints = [
            passwordTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16),
            passwordTextField.widthAnchor.constraint(equalToConstant: controller.view.frame.width - 120),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupErrorLabel() {
        addSubview(errorLabel)
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.textColor = .red
        errorLabel.textAlignment = .center
        errorLabel.numberOfLines = 0
        errorLabel.font = UIFont(name: "Helvetica Neue", size: 12)
        let constraints = [
            errorLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            errorLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            errorLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            errorLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 8)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
