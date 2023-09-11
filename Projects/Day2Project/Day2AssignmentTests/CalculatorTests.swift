//
//  CalculatorTests.swift
//  Day2AssignmentTests
//
//  Created by Amali Krigger on 9/10/23.
//

import XCTest
@testable import Day2Assignment

final class CalculatorTests: XCTestCase {

    var calculatorViewModel:CalculatorViewModel!
    
    override func setUpWithError() throws {
        super.setUp()
        calculatorViewModel = CalculatorViewModel()
    }

    override func tearDownWithError() throws {
        super.tearDown()
        calculatorViewModel = nil
    }
    
    func testCalculate() {
        calculatorViewModel.firstNumber = 10
        calculatorViewModel.tempNumber = "5"
        calculatorViewModel.operation = .Add
        var expectedAnswer:String? = "15.0"
        var actualAnswer = calculatorViewModel.calculate()
        XCTAssertEqual(actualAnswer, expectedAnswer, "Answers are not equal")
        calculatorViewModel.firstNumber = 10
        calculatorViewModel.tempNumber = "5"
        calculatorViewModel.operation = .Subtract
        expectedAnswer = "5.0"
        actualAnswer = calculatorViewModel.calculate()
        XCTAssertEqual(actualAnswer, expectedAnswer, "Answers are not equal")
        calculatorViewModel.firstNumber = 10
        calculatorViewModel.tempNumber = "5"
        calculatorViewModel.operation = .Multiply
        expectedAnswer = "50.0"
        actualAnswer = calculatorViewModel.calculate()
        XCTAssertEqual(actualAnswer, expectedAnswer, "Answers are not equal")
        calculatorViewModel.firstNumber = 10
        calculatorViewModel.tempNumber = "5"
        calculatorViewModel.operation = .Divide
        expectedAnswer = "2.0"
        actualAnswer = calculatorViewModel.calculate()
        XCTAssertEqual(actualAnswer, expectedAnswer, "Answers are not equal")
        calculatorViewModel.firstNumber = 10
        calculatorViewModel.tempNumber = nil
        calculatorViewModel.operation = .Divide
        expectedAnswer = nil
        actualAnswer = calculatorViewModel.calculate()
        XCTAssertEqual(actualAnswer, expectedAnswer, "Temp Number is nil")
        calculatorViewModel.firstNumber = 10
        calculatorViewModel.tempNumber = nil
        calculatorViewModel.operation = nil
        expectedAnswer = nil
        actualAnswer = calculatorViewModel.calculate()
        XCTAssertEqual(actualAnswer, expectedAnswer, "Operation is nil")
    }
    
    func testReset() {
        calculatorViewModel.firstNumber = 10
        calculatorViewModel.tempNumber = "5"
        calculatorViewModel.operation = .Add
        var expectedAnswer:String? = "0"
        var actualAnswer:String? = calculatorViewModel.reset()
        XCTAssertEqual(calculatorViewModel.firstNumber, 0.0, "First number is not equal")
        XCTAssertEqual(calculatorViewModel.secondNumber, 0.0, "Second number is not equal")
        XCTAssertEqual(calculatorViewModel.tempNumber, "0", "Temp number is not equal")
        XCTAssertEqual(calculatorViewModel.operation, nil, "Operation is not equal")
        XCTAssertEqual(actualAnswer, expectedAnswer, "Answer is not equal")
        calculatorViewModel.firstNumber = 10
        calculatorViewModel.tempNumber = "5"
        calculatorViewModel.operation = .Add
        var answer = calculatorViewModel.calculate()
        XCTAssertEqual(answer, "15.0", "Answers are not equal")
        expectedAnswer = "0"
        actualAnswer = calculatorViewModel.reset()
        XCTAssertEqual(calculatorViewModel.firstNumber, 0.0, "First number is not equal")
        XCTAssertEqual(calculatorViewModel.secondNumber, 0.0, "Second number is not equal")
        XCTAssertEqual(calculatorViewModel.tempNumber, "0", "Temp number is not equal")
        XCTAssertEqual(calculatorViewModel.operation, nil, "Operation is not equal")
        XCTAssertEqual(actualAnswer, expectedAnswer, "Answer is not equal")
    }
    
    func testChangeSign() {
        calculatorViewModel.operation = .Add
        var expectedAnswer:String? = "-0"
        var actualAnswer:String? = calculatorViewModel.changeSign(numberLabel: "0")
        XCTAssertEqual(actualAnswer, expectedAnswer, "Answers are not equal")
        calculatorViewModel.tempNumber = "0"
        expectedAnswer = "-0"
        actualAnswer = calculatorViewModel.changeSign(numberLabel: "0")
        XCTAssertEqual(actualAnswer, expectedAnswer, "Answers are not equal")
        expectedAnswer = "1"
        actualAnswer = calculatorViewModel.changeSign(numberLabel: "-1")
        XCTAssertEqual(actualAnswer, expectedAnswer, "Answers are not equal")
        calculatorViewModel.operation = nil
        expectedAnswer = "-1"
        actualAnswer = calculatorViewModel.changeSign(numberLabel: "1")
        XCTAssertEqual(actualAnswer, expectedAnswer, "Answers are not equal")
    }
    
    func testCalculatePercent() {
        var expectedAnswer:String? = "0.1"
        var actualAnswer:String? = calculatorViewModel.calculatePercent(numberLabel: "10")
        XCTAssertEqual(actualAnswer, expectedAnswer, "Answers are not equal")
        expectedAnswer = "0.01"
        actualAnswer = calculatorViewModel.calculatePercent(numberLabel: "1")
        XCTAssertEqual(actualAnswer, expectedAnswer, "Answers are not equal")
        expectedAnswer = "0.2"
        actualAnswer = calculatorViewModel.calculatePercent(numberLabel: "20")
        XCTAssertEqual(actualAnswer, expectedAnswer, "Answers are not equal")
    }
    
    func testSetDecimal() {
        var expectedAnswer:String? = "0."
        var actualAnswer:String? = calculatorViewModel.setDecimal(numberLabel: "0")
        XCTAssertEqual(actualAnswer, expectedAnswer, "Answers are not equal")
        expectedAnswer = "5."
        actualAnswer = calculatorViewModel.setDecimal(numberLabel: "5")
        XCTAssertEqual(actualAnswer, expectedAnswer, "Answers are not equal")
        expectedAnswer = "6.5"
        actualAnswer = calculatorViewModel.setDecimal(numberLabel: "6.5")
        XCTAssertEqual(actualAnswer, expectedAnswer, "Answers are not equal")
        expectedAnswer = nil
        actualAnswer = calculatorViewModel.setDecimal(numberLabel: nil)
        XCTAssertEqual(actualAnswer, expectedAnswer, "Answers are not equal")
    }
    
    func testSetOperation() {
        var expectedAnswer = Operation.Add
        var answer = calculatorViewModel.setOperation(operationInput: .Add, numberLabel: "9")
        XCTAssertEqual(calculatorViewModel.operation, expectedAnswer, "Operations are not equal")
        XCTAssertEqual(answer, nil, "Operations are not equal")
        expectedAnswer = .Subtract
        answer = calculatorViewModel.setOperation(operationInput: .Subtract, numberLabel: "9")
        XCTAssertEqual(calculatorViewModel.operation, expectedAnswer, "Operations are not equal")
        XCTAssertEqual(answer, nil, "Operations are not equal")
        expectedAnswer = .Multiply
        answer = calculatorViewModel.setOperation(operationInput: .Multiply, numberLabel: "9")
        XCTAssertEqual(calculatorViewModel.operation, expectedAnswer, "Operations are not equal")
        XCTAssertEqual(answer, nil, "Operations are not equal")
        expectedAnswer = .Divide
        answer = calculatorViewModel.setOperation(operationInput: .Divide, numberLabel: "9")
        XCTAssertEqual(calculatorViewModel.operation, expectedAnswer, "Operations are not equal")
        XCTAssertEqual(answer, nil, "Operations are not equal")
        calculatorViewModel.operation = .Add
        expectedAnswer = .Add
        calculatorViewModel.tempNumber = "6"
        answer = calculatorViewModel.setOperation(operationInput: .Add, numberLabel: "9")
        XCTAssertEqual(calculatorViewModel.operation, expectedAnswer, "Operations are not equal")
        XCTAssertEqual(answer, "15.0", "Operations are not equal")
    }

}
