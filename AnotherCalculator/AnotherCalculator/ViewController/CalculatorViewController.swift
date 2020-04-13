//
//  CalculatorViewController.swift
//  anotherPursuitCalculator
//
//  Created by Ian Cervone on 4/8/20.
//  Copyright © 2020 Ian Cervone. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
  
//MARK: Variables

  var inputOne = String("")
  var inputTwo = String("")
  var mathType = String("")
  var finalAnswer = Double()
  
//MARK: Views
  lazy var calculatorView: CalculatorView = {
    let calculator = CalculatorView()
    // number buttons
    calculator.zeroButton.addTarget(self, action: #selector(numButtonTapped), for: .touchUpInside)
    calculator.oneButton.addTarget(self, action: #selector(numButtonTapped), for: .touchUpInside)
    calculator.twoButton.addTarget(self, action: #selector(numButtonTapped), for: .touchUpInside)
    calculator.threeButton.addTarget(self, action: #selector(numButtonTapped), for: .touchUpInside)
    calculator.fourButton.addTarget(self, action: #selector(numButtonTapped), for: .touchUpInside)
    calculator.fiveButton.addTarget(self, action: #selector(numButtonTapped), for: .touchUpInside)
    calculator.sixButton.addTarget(self, action: #selector(numButtonTapped), for: .touchUpInside)
    calculator.sevenButton.addTarget(self, action: #selector(numButtonTapped), for: .touchUpInside)
    calculator.eightButton.addTarget(self, action: #selector(numButtonTapped), for: .touchUpInside)
    calculator.nineButton.addTarget(self, action: #selector(numButtonTapped), for: .touchUpInside)
    // math operator buttons
    calculator.decimalButton.addTarget(self, action: #selector(decimalButtonTapped), for: .touchUpInside)
    calculator.multiplicationButton.addTarget(self, action: #selector(operationButtonPressed), for: .touchUpInside)
    calculator.divisionButton.addTarget(self, action: #selector(operationButtonPressed), for: .touchUpInside)
    calculator.additionButton.addTarget(self, action: #selector(operationButtonPressed), for: .touchUpInside)
    calculator.subtractionButton.addTarget(self, action: #selector(operationButtonPressed), for: .touchUpInside)
    calculator.equalsButton.addTarget(self, action: #selector(equalButtonPressed), for: .touchUpInside)
    calculator.clearButton.addTarget(self, action: #selector(clearButtonPressed), for: .touchUpInside)
    return calculator
  }()
  
  
//MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupCalculatorView()
    }
  
  override func viewDidLayoutSubviews() {
        makeButtonsRound()
   }
  
  
//MARK: Private Functions
  private func makeButtonsRound() {
    Extensions.roundButton(button: calculatorView.clearButton)
    Extensions.roundButton(button: calculatorView.equalsButton)
    Extensions.roundButton(button: calculatorView.decimalButton)
    Extensions.roundButton(button: calculatorView.multiplicationButton)
    Extensions.roundButton(button: calculatorView.divisionButton)
    Extensions.roundButton(button: calculatorView.additionButton)
    Extensions.roundButton(button: calculatorView.subtractionButton)
  }

  
//MARK: OBJC Functions
  @objc func numButtonTapped(button: UIButton) {
    if mathType == "" {
      inputOne = inputOne + button.accessibilityValue!
      calculatorView.displayLabel.text = inputOne
      calculatorView.displayLabel.reloadInputViews()
    } else {
      inputTwo = inputTwo + button.accessibilityValue!
      calculatorView.displayLabel.text = inputTwo
    }
  }
  
  @objc func decimalButtonTapped(button: UIButton) {
    if mathType == "" {
      inputOne = inputOne + button.accessibilityValue!
      calculatorView.displayLabel.text = inputOne
      calculatorView.displayLabel.reloadInputViews()
      button.isEnabled = false
    } else {
      inputTwo = inputTwo + button.accessibilityValue!
      calculatorView.displayLabel.text = inputTwo
      button.isEnabled = false
    }
  }
  
  @objc func operationButtonPressed(button: UIButton) {
      calculatorView.multiplicationButton.tintColor = .darkGray
      calculatorView.divisionButton.tintColor = .darkGray
      calculatorView.additionButton.tintColor = .darkGray
      calculatorView.subtractionButton.tintColor = .darkGray
      calculatorView.decimalButton.isEnabled = true
      button.isSelected = true
      button.tintColor = .white
      mathType = button.accessibilityValue ?? ""
    }
    
    @objc func equalButtonPressed(button: UIButton) {
      let text = "\(inputOne) \(mathType) \(inputTwo)"
      let expn = NSExpression(format:text)
      let actualAnswer = expn.expressionValue(with: nil, context: nil) as! Double
      let displayAnswer = Double(round(100000 * actualAnswer)/100000)
      inputOne = displayAnswer.description
      calculatorView.displayLabel.text = inputOne
      inputTwo = ""
      calculatorView.multiplicationButton.tintColor = .darkGray
      calculatorView.divisionButton.tintColor = .darkGray
      calculatorView.additionButton.tintColor = .darkGray
      calculatorView.subtractionButton.tintColor = .darkGray
    }
  
    @objc func clearButtonPressed(button: UIButton) {
        inputOne = ""
        inputTwo = ""
        mathType = ""
        calculatorView.displayLabel.text = inputOne
        calculatorView.multiplicationButton.tintColor = .darkGray
        calculatorView.divisionButton.tintColor = .darkGray
        calculatorView.additionButton.tintColor = .darkGray
        calculatorView.subtractionButton.tintColor = .darkGray
        calculatorView.decimalButton.isEnabled = true
    }
 
  
//MARK: SetUp Views
  private func setupCalculatorView() {
    view.addSubview(calculatorView)
    calculatorView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      calculatorView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      calculatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      calculatorView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      calculatorView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
    ])
  }
}
