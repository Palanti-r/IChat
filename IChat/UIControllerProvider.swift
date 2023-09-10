//
//  UIRepresentable.swift
//  IChat
//
//  Created by Commander on 07.09.2023.
//

import SwiftUI
class UIController {
    var vc = UIViewController()
    init(vc: UIViewController) {
        self.vc = vc
    }
    struct UIControllerProvider: PreviewProvider {
        static var previews: some View {
            ContainerView().edgesIgnoringSafeArea(.all)
        }
        
        struct ContainerView: UIViewControllerRepresentable {
            
            
            var viewController: UIViewController {
                vc
            }
            
            func makeUIViewController(context: Context) -> some UIViewController {
                viewController
            }
            
            func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
                
            }
            
            
        }
    }
}
