//
//  CalculatorTests.swift
//  UnitTestsDemoTests
//
//  Created by MAC on 07/09/23.
//

import XCTest
@testable import UnitTestsDemo


final class CalculatorTests: XCTestCase {

    var calculator: Calculator!

    override func setUpWithError() throws {
        calculator = Calculator()
    }

    override func tearDownWithError() throws {
        calculator = nil
    }

    func testAdd() {
        // input
         let num1 = 5
         let num2 = 10
        // Expected Output
        
        let expectedOutput = 15
        
        let actualOutput =  calculator.add(num1: num1, num2: num2)
        
        XCTAssertEqual(expectedOutput, actualOutput)
    }
    
    
    func testValidateCredentials() {
        
        // if username length is gretter than 5 and password length is gretter than 5

        var userName = "abcdegc1"
        var password = "werwerqwe1"
        
        var expectedOutput = true
        
        var actualOutput = calculator.validateCredentials(userName: userName, password: password)
        
        
        XCTAssertEqual(expectedOutput, actualOutput)
        
        
        
        
        // if username length is less than 5 and password length is gretter than 5

         userName = "abc"
         password = "werwerqwe1"
        
         expectedOutput = false
        
         actualOutput = calculator.validateCredentials(userName: userName, password: password)
        
        
        XCTAssertEqual(expectedOutput, actualOutput)

        
        // if username length is less than 5 and password length is pass than 5

         userName = "abc"
         password = "wer"
        
         expectedOutput = false
        
         actualOutput = calculator.validateCredentials(userName: userName, password: password)
        
        
        XCTAssertEqual(expectedOutput, actualOutput)
        
        
        
        // if username length is   5 and password length is pass 6

         userName = "abcdd"
         password = "werddd"
        
         expectedOutput = false
        
         actualOutput = calculator.validateCredentials(userName: userName, password: password)
        
        
        XCTAssertEqual(expectedOutput, actualOutput)
    }
    
    
    func testGetNames() {
        
        // Input
        
        calculator.names = ["Apple", "Banana"]
        let index = 6
        
        // Output
        
        let expectedOutput = ""
        
        let actualOutput = calculator.getName(for: index)
        
        XCTAssertEqual(expectedOutput, actualOutput)
    }
}
