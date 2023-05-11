//
//  ViewController.swift
//  Calculator
//
//  Created by Nicolas on 10/05/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var displayLabel: UILabel!
    private var isFinishTypingNumber: Bool = true
    private var calculator = CalculatorLogic()
    private var displayValue: Double {
        get {
            guard let  number = Double(displayLabel.text ?? "0") else {
                fatalError("Cannot convert display label to double")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishTypingNumber = true
        calculator.setNumber(displayValue)
        if let calcMethod = sender.currentTitle {
            if let result = calculator.calculate(symbol: calcMethod) {
                displayValue = result
            }
        }
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let numValue = sender.currentTitle {
            if isFinishTypingNumber {
                displayLabel.text =  numValue
                isFinishTypingNumber = false
            } else {
                if numValue == "." {
                    let isInt = floor(displayValue) == displayValue
                    if !isInt {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }
    
}

