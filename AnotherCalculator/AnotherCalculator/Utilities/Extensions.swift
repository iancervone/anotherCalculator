//
//  Extensions.swift
//  anotherPursuitCalculator
//
//  Created by Ian Cervone on 4/8/20.
//  Copyright © 2020 Ian Cervone. All rights reserved.
//

import Foundation
import UIKit

class Extensions {


  static func styleNumButton(button: UIButton, tag: String) {
    let configure = UIImage.SymbolConfiguration(pointSize:100, weight: .thin)
    button.setImage(UIImage(systemName: "\(tag).circle.fill", withConfiguration: configure), for: .normal)
    button.setTitleColor(.systemBlue, for: .normal)
    button.tintColor = #colorLiteral(red: 0, green: 0.4793452024, blue: 0.9990863204, alpha: 1)
    button.showsTouchWhenHighlighted = true
    button.accessibilityValue = tag
  }
  
  static func styleSymbolButton(button: UIButton, symbol: String, width: CGFloat) {
    let configure = UIImage.SymbolConfiguration(pointSize:30, weight: .semibold)
    button.setImage(UIImage(systemName: symbol, withConfiguration: configure), for: .normal)
    button.setTitleColor(.systemBlue, for: .normal)
    button.layer.borderWidth = 5
    button.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    button.backgroundColor = #colorLiteral(red: 0.2936926371, green: 0.8515555157, blue: 0.1425911694, alpha: 1)
    button.tintColor = .darkGray
    button.showsTouchWhenHighlighted = true

  }
  
  static func styleTextButton(button: UIButton, title: String) {
    button.setTitle(title, for: .normal)
    button.titleLabel!.font = UIFont(name: "Thonburi", size: 40)
    button.setTitleColor(.darkGray, for: .normal)
    button.layer.borderWidth = 5
    button.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    button.backgroundColor = .yellow
    button.showsTouchWhenHighlighted = true

  }
  
  static func roundButton(button: UIButton) {
      button.layer.masksToBounds = false
      button.layer.cornerRadius = button.frame.height / 2
      button.clipsToBounds = true
  }
  
  
}
