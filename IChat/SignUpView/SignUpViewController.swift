//
//  SignUpViewController.swift
//  IChat
//
//  Created by Commander on 10.09.2023.
//

import UIKit
import SwiftUI

class SignUpViewController: UIViewController {
    
    typealias viewConstraint = NSLayoutConstraint

    let welcomeLabel = UILabel(text: "Glad to see you!")
    let emailLabel = UILabel(text: "Email")
    let passwordLabel = UILabel(text: "Password")
    let confirmPasswordLabel = UILabel(text: "Confirm password")
    let alreadyPasswordLabel = UILabel(text: "Already onboard?")
    
    let emailTextField = UnderlineTextField(font: .avenir20())
    let passwordTextField = UnderlineTextField(font: .avenir20())
    let confirmPasswordTextField = UnderlineTextField(font: .avenir20())
    
    var isPasswordHide: Bool = true
    
    let passwordHideIndicatorButton = UIButton(type: .system)
    let signUpButton = UIButton(title: "Sign Up", titleColor: .whiteColor, font: nil, isShadow: false, cornerRadius: 1)
    let onboardButton = UIButton(title: "Already onboard?", titleColor: .blackColor, font: nil, isShadow: true, cornerRadius: 1)
    
    let loginButton = UIButton(title: "Login", titleColor: .blackColor, font: nil, isShadow: true, cornerRadius: 1)
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .blue
        
        setupUI()
    }
    
   
}
// MARK: – SignUpViewController
extension SignUpViewController {
    
   
    private func setupUI() {
        
        passwordHideIndicatorButton.setTitle(isPasswordHide ? "1" : "2", for: .normal)
        onboardButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 60).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        
        passwordTextField.isSecureTextEntry = isPasswordHide

        let emailStackView = UIStackView(arrangedSubView: [emailLabel, emailTextField], axis: .vertical, spacing: 0)
        let passwordFieldStackView = UIStackView(arrangedSubView: [passwordTextField, passwordLabel], axis: .horizontal, spacing: 0)
        let passwordStackView = UIStackView(arrangedSubView: [passwordLabel, passwordFieldStackView], axis: .vertical, spacing: 0)
        
        let confirmStackView = UIStackView(arrangedSubView: [confirmPasswordLabel, confirmPasswordTextField], axis: .vertical, spacing: 0)
        
        emailStackView.translatesAutoresizingMaskIntoConstraints = false
        passwordStackView.translatesAutoresizingMaskIntoConstraints = false
        confirmStackView.translatesAutoresizingMaskIntoConstraints = false
        
        passwordStackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        passwordStackView.addSubview(passwordHideIndicatorButton)
        passwordHideIndicatorButton.leadingAnchor.constraint(equalTo: passwordStackView.leadingAnchor).isActive = true
        
        let stackFieldView = UIStackView(arrangedSubView: [
            emailStackView,
            passwordStackView,
            confirmStackView
        ], axis: .vertical, spacing: 40)
        
        let horizontalButtonView = UIStackView(arrangedSubView: [
            onboardButton,
            loginButton
        ], axis: .horizontal, spacing: 10)
        
        let stackButtonView = UIStackView(arrangedSubView: [
            signUpButton,
            horizontalButtonView,
        ], axis: .vertical, spacing: 20)
        
       
        stackFieldView.translatesAutoresizingMaskIntoConstraints = false
        stackButtonView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackFieldView)
        view.addSubview(stackButtonView)

    
        viewConstraint.activate([
            stackFieldView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackFieldView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackFieldView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackFieldView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            stackButtonView.topAnchor.constraint(equalTo: stackFieldView.bottomAnchor, constant: 35),
            stackButtonView.leadingAnchor.constraint(equalTo: stackFieldView.leadingAnchor),
            stackButtonView.heightAnchor.constraint(equalToConstant: 100),
            stackButtonView.trailingAnchor.constraint(equalTo: stackFieldView.trailingAnchor),
            
        ])
        
      

    }
}
struct SignUpViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        
        let viewController = SignUpViewController()
        
        func makeUIViewController(context: Context) -> some UIViewController {
            viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
        
        
    }
}
