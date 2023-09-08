//
//  UserViewModel.swift
//  Countries
//
//  Created by MAC on 08/09/23.
//

import Foundation

class UserViewModel {
    
    private let networkManager = NetworkManager()
    private(set) var users: [User] = []
    
    func getUsers(completionHanlder:@escaping (Result<[User], Error>)-> Void) {
        networkManager.get(urlStr: "https://reqres.in/api/users", type: UserResponse.self) { result in
            switch result {
            case .success(let userResponse):
                self.users = userResponse.data
                completionHanlder(.success(self.users))
            case .failure(let error):
                print(error.localizedDescription)
                completionHanlder(.failure(error))
            }
            
        }
        
    }
}
