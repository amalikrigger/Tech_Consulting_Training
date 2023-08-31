//
//  CalculatorViewController.swift
//  Day2Assignment
//
//  Created by Amali Krigger on 8/25/23.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var numberLabel: UILabel!

    var username = ""
    var firstNumber = 0.0
    var secondNumber = 0.0
    var tempNumber:String = "0"
    var decimalIsAdded = false
    enum Operation : String {
        case Add = "+"
        case Subtract = "-"
        case Divide = "/"
        case Multiply = "X"
    }
    var operation:Operation?

    override func viewDidLoad() {
        super.viewDidLoad()
        numberLabel.text = "0"
    }
    @IBAction func zeroTapped(_ sender: Any) {
        setNumber(number: "0")
    }
    @IBAction func oneTapped(_ sender: Any) {
        setNumber(number: "1")
    }
    @IBAction func twoTapped(_ sender: Any) {
        setNumber(number: "2")
    }
    @IBAction func threeTapped(_ sender: Any) {
        setNumber(number: "3")
    }
    @IBAction func fourTapped(_ sender: Any) {
        setNumber(number: "4")
    }
    @IBAction func fiveTapped(_ sender: Any) {
        setNumber(number: "5")
    }
    @IBAction func sixTapped(_ sender: Any) {
        setNumber(number: "6")
    }
    @IBAction func sevenTapped(_ sender: Any) {
        setNumber(number: "7")
    }
    @IBAction func eightTapped(_ sender: Any) {
        setNumber(number: "8")
    }
    @IBAction func nineTapped(_ sender: Any) {
        setNumber(number: "9")
    }
    @IBAction func plusTapped(_ sender: Any) {
        setOperation(operationInput: Operation.Add)
    }
    @IBAction func minusTapped(_ sender: Any) {
        setOperation(operationInput: Operation.Subtract)
    }
    @IBAction func divideTapped(_ sender: Any) {
        setOperation(operationInput: Operation.Divide)
    }
    @IBAction func multiplyTapped(_ sender: Any) {
        setOperation(operationInput: Operation.Multiply)
    }
    @IBAction func cancelTapped(_ sender: Any) {
        numberLabel.text = "0"
        firstNumber = 0.0
        secondNumber = 0.0
        tempNumber = "0"
        operation = nil
    }
    @IBAction func signTapped(_ sender: Any) {
        if (numberLabel.text != nil) {
            if (operation != nil && numberLabel.text == "0") {
                numberLabel.text = "-0"
                tempNumber = numberLabel.text!
            } else if (operation != nil && tempNumber == "0") {
                numberLabel.text = "-0"
                tempNumber = "0"
            } else if (numberLabel.text!.contains("-")) {
                numberLabel.text!.removeFirst()
                tempNumber = numberLabel.text!
            } else {
                numberLabel.text = "-" + numberLabel.text!
                tempNumber = numberLabel.text!
            }
        }
    }
    @IBAction func percentTapped(_ sender: Any) {
        let number = (Double(numberLabel.text ?? "0") ?? 0) * 0.01
        tempNumber = String(number)
        numberLabel.text = tempNumber
    }
    @IBAction func decimalTapped(_ sender: Any) {
        if (numberLabel.text == "0") {
            tempNumber = ("0.")
            numberLabel.text = tempNumber
        }
        else if (!decimalIsAdded && operation != nil) {
            tempNumber = ("0.")
            numberLabel.text = tempNumber
        } else {
            tempNumber.append(".")
            numberLabel.text = tempNumber
        }
        decimalIsAdded = true
    }
    @IBAction func equalsTapped(_ sender: Any) {
        if let secondNum = Double(tempNumber) {
            secondNumber = secondNum
        }
        switch operation {
        case .Add:
            let answer = firstNumber + secondNumber
            numberLabel.text = String(answer)
            operation = nil
            tempNumber = "0"
        case .Subtract:
            let answer = firstNumber - secondNumber
            numberLabel.text = String(answer)
            operation = nil
            tempNumber = "0"
        case .Multiply:
            let answer = firstNumber * secondNumber
            numberLabel.text = String(answer)
            operation = nil
            tempNumber = "0"
        case .Divide:
            if (secondNumber != 0) {
                let answer = firstNumber / secondNumber
                numberLabel.text = String(answer)
                operation = nil
                tempNumber = "0"
            }
        case nil:
            print("Operation is nil")
        }
    }
    
    func setNumber(number:String) {
        if (tempNumber == "0") {
            tempNumber = number
            numberLabel.text = tempNumber
        } else {
            tempNumber.append(number)
            numberLabel.text = tempNumber
        }
    }
    
    func setOperation(operationInput: Operation) {
        if (operation == nil) {
            if let firstNum = Double(numberLabel.text ?? "0") {
                firstNumber = firstNum
            }
            operation = operationInput
            tempNumber = "0"
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
