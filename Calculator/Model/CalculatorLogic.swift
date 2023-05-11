//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Nicolas on 11/05/23.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    private var intermediateCalculation: (n1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double?{
        if let number = number {
            switch symbol {
            case "+/-": return number * -1
            case "AC": return 0
            case "%": return number * 0.01
            case "=": return performTwoCalculation(n2: number)
            default: intermediateCalculation = (n1: number, calcMethod: symbol)
            }
        }
        return nil
    }
    
    func performTwoCalculation(n2: Double) -> Double?{
        if let n1 = intermediateCalculation?.n1,
           let operation = intermediateCalculation?.calcMethod {
            
            switch operation {
            case "+": return n1 + n2
            case "-": return n1 - n2
            case "x": return n1 * n2
            case "÷": return n1 / n2
            default:
                fatalError("the opertion passed does not match any of the cases")
            }
        }
        return nil
    }
}
