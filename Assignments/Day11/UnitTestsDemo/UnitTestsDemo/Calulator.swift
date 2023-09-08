//
//  Calulator.swift
//  UnitTestsDemo
//
//  Created by MAC on 07/09/23.
//

import Foundation


class Calculator {
    
    var names: [String] = []
    
    func add(num1: Int, num2: Int)-> Int {
        return num1 + num2
    }
    
    func substract(num1: Int, num2: Int)-> Int {
        return num1 - num2
    }
    
    // userName length should be gretter than 5
    // passowrd length should be gretter than 6
    // userName  should be alphaNumeric
    // passowrd  should be alphaNumeric
    
    func validateCredentials(userName: String, password: String)-> Bool {
        guard userName.count > 5 && password.count > 6 else {
            return false
        }
        guard isAlphaNumberic(input: userName) else {
            return false
        }
        guard isAlphaNumberic(input: password) else {
            return false
        }
        return true
    }
    
    func isAlphaNumberic(input: String)-> Bool {
        return true
    }
    
    
    
    func getName(for index: Int)-> String {
        if index < names.count, index >= 0  {
            return names[index]
        }else {
            return ""
        }
    }
}
