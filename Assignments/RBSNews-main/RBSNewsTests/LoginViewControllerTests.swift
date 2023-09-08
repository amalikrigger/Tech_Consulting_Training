//
//  LoginViewControllerTests.swift
//  RBSNewsTests
//
//  Created by MAC on 01/12/21.
//

import XCTest
@testable import RBSNews

class LoginViewControllerTests: XCTestCase {

    var loginViewModel:LoginViewModel!
    
    override func setUpWithError() throws {
        
        loginViewModel = LoginViewModel()
    }

    override func tearDownWithError() throws {
        loginViewModel = nil
    }

    
    func testLoginValidation() {
        
        var expectedOutput = "Please input credentials."
       var actualOutput =  loginViewModel.validateCredentials(userName:"", password: "")
        print("1. \(actualOutput ?? "")")
        
        XCTAssertEqual(expectedOutput, actualOutput)
        
        expectedOutput = "Password is invalid"
        actualOutput =  loginViewModel.validateCredentials(userName:"rbs", password: "afasd")
        print("2. \(actualOutput ?? "")")
        
        XCTAssertEqual(expectedOutput, actualOutput)
        
        expectedOutput = "Username is invalid"
        actualOutput =  loginViewModel.validateCredentials(userName:"afa", password: "1234")
        print("3. \(actualOutput ?? "")")
        
        XCTAssertEqual(expectedOutput, actualOutput)
        
        actualOutput =  loginViewModel.validateCredentials(userName:"rbs", password: "1234")
        print("4. \(actualOutput ?? "Password & Username is correct")")
        
        XCTAssertNil(actualOutput)
    }

}
