//
//  UIStackView + Extension.swift
//  IChat
//
//  Created by Commander on 10.09.2023.
//

import UIKit

extension UIStackView {
    convenience init(arrangedSubView: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat) {
        self.init(arrangedSubviews: arrangedSubView)
        self.axis = axis
        self.spacing = spacing
    }
}
