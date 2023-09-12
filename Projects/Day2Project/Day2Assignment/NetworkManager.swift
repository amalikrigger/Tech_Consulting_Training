//
//  NetworkManager.swift
//  Day2Assignment
//
//  Created by Amali Krigger on 9/5/23.
//

import Foundation

class NetworkManager {
    func get<T: Decodable>(urlString: String, type:T.Type, completionHandler: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            return
        }
        let request = URLRequest(url: url)
        let urlSession = URLSession.shared
        let dataTask = urlSession.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                return completionHandler(.failure(error!))
            }
            let jsonDecoder = JSONDecoder()
            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
            do {
                let result = try jsonDecoder.decode(type.self, from: data)
                print(result)
                completionHandler(.success(result))
            } catch {
                print(error.localizedDescription)
            }
        }
        dataTask.resume()
    }
}
