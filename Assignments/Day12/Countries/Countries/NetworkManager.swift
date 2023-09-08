//
//  NetworkManager.swift
//  Countries
//
//  Created by MAC on 05/09/23.
//

import Foundation

//enum Result<Success, Failure: Error> {
//    case success(Success)
//    case failure(Failure)
//}
//
//enum Result<Success, Failure> where Failure : Error {
//
//    /// A success, storing a `Success` value.
//    case success(Success)
//
//    /// A failure, storing a `Failure` value.
//    case failure(Failure)
//}

class NetworkManager {
    
//    
    
    func get<T: Decodable>(urlStr: String, type:T.Type, completionHandler:@escaping (Result<T, Error>)-> Void) {
        
        print(type)
        guard let url = URL(string: urlStr) else {
            return
        }
      let request = URLRequest(url: url)
      let urlSession =   URLSession.shared
       let sessionTask =  urlSession.dataTask(with: request) { data, response, error in
           
           guard let data = data, error == nil  else {
               return completionHandler(.failure(error!))
           }
           let jsonDecoder = JSONDecoder()
           jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
           do {
               let  countries =  try  jsonDecoder.decode(type.self, from: data)
               
               print(countries)
               completionHandler(.success(countries))
           }catch {
               print(error.localizedDescription)
           }
        }
        sessionTask.resume()
    }
    
    
}

