//
//  TabViewController.swift
//  IChat
//
//  Created by Commander on 25.09.2023.
//

import UIKit

class TabViewController: UITabBarController {
    
    let peopleVC = PeopleViewController()
    let listVC = ListViewController()
    
    
    let boldConfiguration = UIImage.SymbolConfiguration(weight: .medium)
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = .white
        tabBar.backgroundColor = .lightGray
        
        
        let peopleImage = UIImage(systemName: "person.2", withConfiguration: boldConfiguration) ?? UIImage()
        let conversationImage = UIImage(systemName: "bubble.left.and.bubble.right", withConfiguration: boldConfiguration) ?? UIImage()
        
        viewControllers = [
            generateNavigationController(rootViewController: peopleVC, title: "People", image: peopleImage),
            generateNavigationController(rootViewController: listVC, title: "Conversation", image: conversationImage)
        ]
    }
    private func generateNavigationController(rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
  
        navigationVC.tabBarItem.image = image
        navigationVC.tabBarItem.title = title
        return navigationVC
    }
    
    
}
