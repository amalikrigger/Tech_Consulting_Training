//
//  CalculatorViewController.swift
//  Day2Assignment
//
//  Created by Amali Krigger on 8/25/23.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var numberLabel: UILabel!
    var viewModel = CalculatorViewModel()
    var username = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        numberLabel.text = "0"
    }
    @IBAction func zeroTapped(_ sender: Any) {
        numberLabel.text = viewModel.setNumber(number: "0")
    }
    @IBAction func oneTapped(_ sender: Any) {
        numberLabel.text = viewModel.setNumber(number: "1")
    }
    @IBAction func twoTapped(_ sender: Any) {
        numberLabel.text = viewModel.setNumber(number: "2")
    }
    @IBAction func threeTapped(_ sender: Any) {
        numberLabel.text = viewModel.setNumber(number: "3")
    }
    @IBAction func fourTapped(_ sender: Any) {
        numberLabel.text = viewModel.setNumber(number: "4")
    }
    @IBAction func fiveTapped(_ sender: Any) {
        numberLabel.text = viewModel.setNumber(number: "5")
    }
    @IBAction func sixTapped(_ sender: Any) {
        numberLabel.text = viewModel.setNumber(number: "6")
    }
    @IBAction func sevenTapped(_ sender: Any) {
        numberLabel.text = viewModel.setNumber(number: "7")
    }
    @IBAction func eightTapped(_ sender: Any) {
        numberLabel.text = viewModel.setNumber(number: "8")
    }
    @IBAction func nineTapped(_ sender: Any) {
        numberLabel.text = viewModel.setNumber(number: "9")
    }
    @IBAction func plusTapped(_ sender: Any) {
        if let num = viewModel.setOperation(operationInput: Operation.Add, numberLabel: numberLabel.text) {
            numberLabel.text = num
        }
    }
    @IBAction func minusTapped(_ sender: Any) {
        if let num = viewModel.setOperation(operationInput: Operation.Subtract, numberLabel: numberLabel.text) {
            numberLabel.text = num
        }
    }
    @IBAction func divideTapped(_ sender: Any) {
        if let num = viewModel.setOperation(operationInput: Operation.Divide, numberLabel: numberLabel.text) {
            numberLabel.text = num
        }
    }
    @IBAction func multiplyTapped(_ sender: Any) {
        if let num = viewModel.setOperation(operationInput: Operation.Multiply, numberLabel: numberLabel.text) {
            numberLabel.text = num
        }
    }
    @IBAction func cancelTapped(_ sender: Any) {
        numberLabel.text = viewModel.reset()
    }
    @IBAction func signTapped(_ sender: Any) {
        if let num = viewModel.changeSign(numberLabel: numberLabel.text)  {
            numberLabel.text = num
        }
    }
    @IBAction func percentTapped(_ sender: Any) {
        numberLabel.text = viewModel.calculatePercent(numberLabel: numberLabel.text)
    }
    @IBAction func decimalTapped(_ sender: Any) {
        if let numLabel = viewModel.setDecimal(numberLabel: numberLabel.text) {
            numberLabel.text = numLabel
        }
    }
    @IBAction func equalsTapped(_ sender: Any) {
        numberLabel.text = viewModel.calculate()
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
