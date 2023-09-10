//
//  ViewController.swift
//  IChat
//
//  Created by Commander on 06.09.2023.
//

import UIKit
import SwiftUI


class AuthViewController: UIViewController {
    
    let googleLabel = UILabel(text: "Get start with")
    let emailLabel = UILabel(text: "or sign up with")
    let loginLabel = UILabel(text: "already onboard?")
    
    let googleButton = UIButton(title: "Google", titleColor: .whiteColor)
    let emailButton = UIButton(title: "Email", titleColor: .blackColor, isShadow: true)
    let loginButton = UIButton(title: "Login", titleColor: .blackColor, isShadow: true)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.мшуц
        
        
    }


    private func setupUI() {
      
        let googleButtonStack = ButtonFormView(label: googleLabel, button: googleButton)
        let emailButtonStack = ButtonFormView(label: emailLabel, button: emailButton)
        let loginButtonStack = ButtonFormView(label: loginLabel, button: loginButton)
        let stackView = UIStackView(arrangedSubviews: [googleButtonStack, emailButtonStack, loginButtonStack])
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 100
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -40)
        ])
        
        
    }
}
 


//MARK: – PreviewProvider
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

 
