//
//  User.swift
//  Netorking
//
//  Created by MAC on 30/08/23.
//

import Foundation


struct Resonse: Decodable {

    let data: [User]
}

struct User: Decodable {
    let id: Int
    let email: String
    let firstName: String
    let lastName: String
    let avatar: String
}

