//
//  UIColor+Extension.swift
//  IChat
//
//  Created by Commander on 06.09.2023.
//

import UIKit
 

extension UIColor {
  enum TitleColor {
    case whiteColor
    case blackColor
      
      var titleColor: UIColor {
          switch self {
              
          case .whiteColor:
              return UIColor.white
          case .blackColor:
              return UIColor.black
          }
      }
  }
}
