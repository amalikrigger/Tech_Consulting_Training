//
//  LoginViewModel.swift
//  RBSNews
//
//  Created by Amali Krigger on 9/8/23.
//

import Foundation

class LoginViewModel {    
    func validateCredentials(userName: String, password: String) -> String? {
        
        if userName.isEmpty || password.isEmpty {
            return "Please input credentials."
        }
        
        if password != "1234" {
            return "Password is invalid"
        }
        
        if userName != "rbs" {
            return "Username is invalid"
        }
        
        return nil
    }
}
