//
//  CalculatorView.swift
//  anotherPursuitCalculator
//
//  Created by Ian Cervone on 4/8/20.
//  Copyright © 2020 Ian Cervone. All rights reserved.
//

import UIKit

class CalculatorView: UIView {
  
  var screenWidth = CGFloat()
  
//MARK: Views
   lazy var displayLabel: UILabel = {
     let label = UILabel()
    label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    label.text = ""
    label.font = UIFont(name: "Heiti TC", size: 65)
    label.textAlignment = .right
    label.backgroundColor = .clear
    let bottomLine = CALayer()
    bottomLine.frame = CGRect(x: 15, y: screenWidth / 4.6, width: screenWidth * 0.94, height: 2)
    bottomLine.backgroundColor = #colorLiteral(red: 1, green: 0.9999318719, blue: 0.006641706917, alpha: 1)
    label.layer.addSublayer(bottomLine)
     return label
   }()
  
  lazy var zeroButton: UIButton = {
    let button = UIButton()
    Extensions.styleNumButton(button: button, tag: "0")
    return button
  }()

  lazy var oneButton: UIButton = {
    let button = UIButton()
    Extensions.styleNumButton(button: button, tag: "1")
    return button
  }()
  
  lazy var twoButton: UIButton = {
    let button = UIButton()
    Extensions.styleNumButton(button: button, tag: "2")
    return button
  }()
  
  lazy var threeButton: UIButton = {
    let button = UIButton()
    Extensions.styleNumButton(button: button, tag: "3")
    return button
  }()
  
  lazy var fourButton: UIButton = {
    let button = UIButton()
    Extensions.styleNumButton(button: button, tag: "4")
    return button
  }()
  
  lazy var fiveButton: UIButton = {
    let button = UIButton()
    Extensions.styleNumButton(button: button, tag: "5")
    return button
  }()
  
  lazy var sixButton: UIButton = {
    let button = UIButton()
    Extensions.styleNumButton(button: button, tag: "6")
    return button
  }()
  
  lazy var sevenButton: UIButton = {
    let button = UIButton()
    Extensions.styleNumButton(button: button, tag: "7")
    return button
  }()
  
  lazy var eightButton: UIButton = {
    let button = UIButton()
    Extensions.styleNumButton(button: button, tag: "8")
    return button
  }()
  
  lazy var nineButton: UIButton = {
    let button = UIButton()
    Extensions.styleNumButton(button: button, tag: "9")
    return button
  }()
  
  lazy var decimalButton: UIButton = {
    let button = UIButton()
    Extensions.styleNumButton(button: button, tag: ".")
    let configure = UIImage.SymbolConfiguration(pointSize:10, weight: .regular)
    button.setImage(UIImage(systemName: "circle.fill", withConfiguration: configure), for: .normal)
    button.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    button.layer.borderWidth = 8
    button.backgroundColor = #colorLiteral(red: 0, green: 0.4793452024, blue: 0.9990863204, alpha: 1)
    button.tintColor = .black
    return button
  }()
  
  lazy var multiplicationButton: UIButton = {
    let button = UIButton()
    Extensions.styleSymbolButton(button: button, symbol: "multiply", width: screenWidth)
    button.accessibilityValue = "*"
    return button
  }()
  
  lazy var divisionButton: UIButton = {
    let button = UIButton()
    Extensions.styleSymbolButton(button: button, symbol: "divide", width: screenWidth)
     button.accessibilityValue = "/"
    return button
  }()
  
  lazy var additionButton: UIButton = {
    let button = UIButton()
    Extensions.styleSymbolButton(button: button, symbol: "plus", width: screenWidth)
     button.accessibilityValue = "+"
    return button
  }()

  lazy var subtractionButton: UIButton = {
    let button = UIButton()
    Extensions.styleSymbolButton(button: button, symbol: "minus", width: screenWidth)
     button.accessibilityValue = "-"
    return button
  }()
  
  lazy var placeHolderButton: UIButton = {
    let button = UIButton()
    Extensions.styleNumButton(button: button, tag: " ")
    button.isUserInteractionEnabled = false
    return button
  }()
  
  lazy var clearButton: UIButton = {
    let button = UIButton()
    Extensions.styleTextButton(button: button, title: "clear")
    return button
  }()
  
  lazy var equalsButton: UIButton = {
    let button = UIButton()
    Extensions.styleTextButton(button: button, title: "equals")
    return button
  }()
  
  
  
// MARK: Initializers
    override init(frame: CGRect) {
      super.init(frame: UIScreen.main.bounds)
      screenWidth =  self.frame.width
      setUpCalculatorViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


  
  //MARK: Setup Views / Constraints
    private func setUpCalculatorViews() {
      setUpdisplayLabel()
      firstRowStackViewSetup()
      secondRowStackViewSetup()
      thirdRowStackViewSetup()
      fourthRowStackViewSetup()
      fifthRowStackViewSetup()
      print(screenWidth)
//      fullStackViewSetup()
    }
  
  private func setUpdisplayLabel() {
    addSubview(displayLabel)
    displayLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      displayLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 100),
      displayLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
      displayLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
      displayLabel.heightAnchor.constraint(equalToConstant: 100)
    ])
  }
  
  private func firstRowStackViewSetup() {
    let stackView = UIStackView(arrangedSubviews: [sevenButton, eightButton, nineButton, multiplicationButton])
    stackView.axis = .horizontal
    stackView.distribution = .fillEqually
    self.addSubview(stackView)

    stackView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      stackView.topAnchor.constraint(equalTo: displayLabel.bottomAnchor),
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
        stackView.heightAnchor.constraint(equalToConstant: screenWidth / 4)
      ])
  }
  
  private func secondRowStackViewSetup() {
    let stackView = UIStackView(arrangedSubviews: [fourButton, fiveButton, sixButton, divisionButton])
    stackView.axis = .horizontal
    stackView.distribution = .fillEqually
    self.addSubview(stackView)

    stackView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      stackView.topAnchor.constraint(equalTo: displayLabel.bottomAnchor, constant: screenWidth * 0.25),
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
        stackView.heightAnchor.constraint(equalToConstant: screenWidth / 4)
      ])
  }
  
  private func thirdRowStackViewSetup() {
    let stackView = UIStackView(arrangedSubviews: [oneButton, twoButton, threeButton, additionButton])
    stackView.axis = .horizontal
    stackView.distribution = .fillEqually
    self.addSubview(stackView)

    stackView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      stackView.topAnchor.constraint(equalTo: displayLabel.bottomAnchor, constant: screenWidth * 0.5),
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
        stackView.heightAnchor.constraint(equalToConstant: screenWidth / 4)
      ])
  }
  
  private func fourthRowStackViewSetup() {
    let stackView = UIStackView(arrangedSubviews: [decimalButton, zeroButton, placeHolderButton, subtractionButton])
    stackView.axis = .horizontal
    stackView.distribution = .fillEqually
    self.addSubview(stackView)

    stackView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      stackView.topAnchor.constraint(equalTo: displayLabel.bottomAnchor, constant: screenWidth * 0.75),
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
        stackView.heightAnchor.constraint(equalToConstant: screenWidth / 4)
    ])
  }
  
  private func fifthRowStackViewSetup() {
    let stackView = UIStackView(arrangedSubviews: [clearButton, equalsButton])
    stackView.axis = .horizontal
    stackView.distribution = .fillEqually
    self.addSubview(stackView)

    stackView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      stackView.topAnchor.constraint(equalTo: displayLabel.bottomAnchor, constant: screenWidth),
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
        stackView.heightAnchor.constraint(equalToConstant: screenWidth / 4.5)
    ])
  }
  
//  private func fullStackViewSetup() {
//      let stackView = UIStackView(arrangedSubviews: [firstRowStackViewSetup, secondRowStackViewSetup, thirdRowStackViewSetup, fourthRowStackViewSetup, fithRowStackViewSetup])
//      stackView.axis = .horizontal
//      stackView.distribution = .fillEqually
//      self.addSubview(stackView)
//
//      stackView.translatesAutoresizingMaskIntoConstraints = false
//      NSLayoutConstraint.activate([
//        stackView.topAnchor.constraint(equalTo: displayLabel.bottomAnchor, constant: 0),
//        stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
//        stackView.heightAnchor.constraint(equalTo: widthAnchor),
//        stackView.widthAnchor.constraint(equalTo: widthAnchor)
//      ])
//    }
  
  
}


