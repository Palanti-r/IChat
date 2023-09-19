//
//  ViewController.swift
//  IChat
//
//  Created by Commander on 06.09.2023.
//

import UIKit
import SwiftUI


class AuthViewController: UIViewController {
    
    typealias viewConstraint = NSLayoutConstraint
    
    let googleLabel = UILabel(text: "Get start with")
    let emailLabel = UILabel(text: "or sign up with")
    let loginLabel = UILabel(text: "already onboard?")
    
    let googleButton = UIButton(title: "Google", titleColor: .blackColor, isShadow: true)
    let emailButton = UIButton(title: "Email", titleColor: .whiteColor)
    let loginButton = UIButton(title: "Login", titleColor: .blackColor, isShadow: true)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}
// MARK: – extension AuthViewController

extension AuthViewController {
    
    private func setupUI() {
        
        googleButton.customizeGoogleButton()
        
        let googleButtonStack = ButtonStackView(label: googleLabel, button: googleButton)
        let emailButtonStack = ButtonStackView(label: emailLabel, button: emailButton)
        let loginButtonStack = ButtonStackView(label: loginLabel, button: loginButton)
        
        
        let buttonStackView = UIStackView(
            arrangedSubView: [
                googleButtonStack,
                emailButtonStack,
                loginButtonStack
            ],axis: .vertical, spacing: 100)
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonStackView)
        
        
        
        viewConstraint.activate([
            buttonStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            buttonStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            buttonStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -40)
        ])
        
        
    }
}
 


// MARK: – Previews

struct AuthViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let viewController = AuthViewController()
        
        func makeUIViewController(context: Context) -> some UIViewController {
            viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }

    }
}

 
