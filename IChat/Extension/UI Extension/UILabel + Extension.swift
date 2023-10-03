//
//  UILabel + Extension.swift
//  IChat
//
//  Created by Commander on 10.09.2023.
//

import UIKit

extension UILabel {
    
    convenience init(text: String, font: UIFont? = UIFont(name: "avenir", size: 20)) {
        self.init()
        
        self.text = text
        self.font = font
    }
    
}
