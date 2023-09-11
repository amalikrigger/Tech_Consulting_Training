//
//  CalculatorViewModel.swift
//  Day2Assignment
//
//  Created by Amali Krigger on 9/10/23.
//

import Foundation

class CalculatorViewModel {
    var firstNumber = 0.0
    var secondNumber = 0.0
    var tempNumber:String? = "0"
    var decimalIsAdded = false
    var operation:Operation?
    
    func setNumber(number:String) -> String {
        if (tempNumber == "0" || tempNumber == nil) {
            tempNumber = number
            return tempNumber ?? "0"
        } else {
            tempNumber!.append(number)
            return tempNumber!
        }
    }
    
    func calculate() -> String? {
        if let secondNum = Double(tempNumber ?? "") {
            secondNumber = secondNum
            switch operation {
            case .Add:
                let answer = firstNumber + secondNumber
                operation = nil
                tempNumber = "0"
                return String(answer)
            case .Subtract:
                let answer = firstNumber - secondNumber
                operation = nil
                tempNumber = "0"
                return String(answer)
            case .Multiply:
                let answer = firstNumber * secondNumber
                operation = nil
                tempNumber = "0"
                return String(answer)
            case .Divide:
                if (secondNumber != 0) {
                    let answer = firstNumber / secondNumber
                    operation = nil
                    tempNumber = "0"
                    return String(answer)
                }
            case nil:
                return nil
            }
        }
        return nil
    }
    
    func setOperation(operationInput: Operation, numberLabel:String?) -> String? {
        if (operation == nil) {
            if let firstNum = Double(numberLabel ?? "0") {
                firstNumber = firstNum
            }
            operation = operationInput
            tempNumber = nil
            return nil
        } else {
            if (tempNumber != nil) {
                let answer = calculate()
                if let firstNum = Double(answer ?? String(firstNumber)) {
                    firstNumber = firstNum
                }
                operation = operationInput
                tempNumber = "0"
                return answer
            } else {
                operation = operationInput
                return nil
            }
        }
    }
    
    func setDecimal(numberLabel:String?) -> String? {
        guard let numLabel = numberLabel else {
            return nil
        }
        if(!numLabel.contains(".")) {
            tempNumber = numberLabel
            tempNumber!.append(".")
            return tempNumber!
        } else {
            return numLabel
        }
    }
    
    func calculatePercent(numberLabel:String?) -> String {
        let number = (Double(numberLabel ?? "0") ?? 0) * 0.01
        tempNumber = String(number)
        return tempNumber ?? "0"
    }
    
    func reset() -> String {
        firstNumber = 0.0
        secondNumber = 0.0
        tempNumber = "0"
        operation = nil
        decimalIsAdded = false
        return "0"
    }
    
    func changeSign(numberLabel:String?) -> String? {
        var numResult = numberLabel
        if (numResult != nil) {
            if (operation != nil && numResult == "0") {
                numResult = "-0"
                tempNumber = numResult ?? "0"
                return numResult
            } else if (operation != nil && tempNumber == "0") {
                numResult = "-0"
                tempNumber = "0"
                return numResult
            } else if (numResult!.contains("-")) {
                numResult!.removeFirst()
                tempNumber = numResult!
                return numResult!
            } else {
                numResult = "-" + numResult!
                tempNumber = numResult!
                return numResult
            }
        } else {
            return nil
        }
    }
}
