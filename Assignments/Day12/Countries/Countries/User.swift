//
//  User.swift
//  Countries
//
//  Created by MAC on 08/09/23.
//

import Foundation

struct UserResponse: Decodable {
    let data: [User]
}

struct User: Decodable {
    let firstName: String
    let lastName: String
    let email: String
}
