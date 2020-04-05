//
//  CalculatorLogic.swift
//  ExDay2.iOSBasic.AnhND47
//
//  Created by Nguyen Duy anh on 4/4/20.
//  Copyright © 2020 Nguyen Duy anh. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    private var number: Double?
    
    private var tempCalculation:(num: Double, calcMethod: String)?
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(element: String) -> Double? {
        if let number = number {
            switch element {
            case "+/-":
                return number * -1
            case "%":
                return number * 0.01
            case "AC":
                return 0
            case "=":
                return performTwoNumCalculation(number)
            default:
                tempCalculation = (num: number, calcMethod: element)
            }
        }
        return nil
    }
    
    private func performTwoNumCalculation(_ number2: Double) -> Double? {
        if let number1 = tempCalculation?.num,
            let operation = tempCalculation?.calcMethod {
            switch operation {
            case "+":
                return number1 + number2
            case "-":
                return number1 - number2
            case "×":
                return number1 * number2
            case "÷":
                return number1 / number2
            default:
                fatalError("The operation passed in does not match any of the cases")
            }
        }
        return nil
    }
}
