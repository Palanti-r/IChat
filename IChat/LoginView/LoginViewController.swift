//
//  LoginViewController.swift
//  IChat
//
//  Created by Commander on 18.09.2023.
//

import UIKit
import SwiftUI

class LoginViewController: UIViewController {
    
}

struct LoginViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let viewController = LoginViewController()
        
        func makeUIViewController(context: Context) -> some UIViewController {
            viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }

    }
}
