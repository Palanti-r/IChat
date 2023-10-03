//
//  UIButton+Extension.swift
//  IChat
//
//  Created by Commander on 06.09.2023.
//

import UIKit


extension UIButton {
    
    convenience init(
        title: String,
        titleColor: UIColor.TitleColor,
        font: UIFont? = UIFont(name: "avenir", size: 20),
        isShadow: Bool = false,
        cornerRadius: CGFloat = 5,
        view: Bool? = false
    ) {
        self.init()
        self.init(type: .system)
        self.setTitle(title, for: .normal)
        if titleColor == .whiteColor {
            self.setTitleColor(.white, for: .normal)
            self.backgroundColor = .black
            
            
        } else {
            self.setTitleColor(.black, for: .normal)
            self.backgroundColor = .white
        }
        self.titleLabel?.font = font
        self.layer.cornerRadius = cornerRadius
        
        
        if isShadow {
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowRadius = 4
            self.layer.shadowOpacity = 0.2
            self.layer.shadowOffset = CGSize(width: 0, height: 4 )
        }
        if !(view ?? false) {
            self.translatesAutoresizingMaskIntoConstraints = false
        }
        
        
    }
    func customizeGoogleButton() {
        let googleLogo: UIImageView = {
            let image = UIImageView()
            image.image = #imageLiteral(resourceName: "image")
            image.contentMode = .scaleAspectFit
            
            return image
            
        }()
        googleLogo.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(googleLogo)
        googleLogo.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24).isActive = true
        googleLogo.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
}
