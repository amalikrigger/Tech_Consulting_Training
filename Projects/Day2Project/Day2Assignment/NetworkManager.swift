//
//  NetworkManager.swift
//  Day2Assignment
//
//  Created by Amali Krigger on 9/5/23.
//

import Foundation


class NetworkManager {
    var delegate: NetworkManagerActions?
    func getCountries(completionHandler:@escaping ([Country]?, Error?) -> Void) {
//        guard let url = URL(string:"https://gist.githubusercontent.com/peymano-wmt/32dcb892b06648910ddd40406e37fdab/raw/db25946fd77c5873b0303b858e861ce724e0dcd0/countries.json") else { return }
        
        guard let url = URL(string:"https://gist.githubusercontent/peymano-wmt/32dcb892b06648910ddd40406e37fdab/raw/db25946fd77c5873b0303b858e861ce724e0dcd0/countries.json") else { return }

        let urlSession = URLSession(configuration: URLSessionConfiguration.default)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        let dataTask = urlSession.dataTask(with: urlRequest) { data, response, error in
            print(response ?? "Response not available")
            print(error ?? "Error not available")
            print(data ?? "Data not available")
            guard let data = data, error == nil else {
                return completionHandler(nil, error)
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            do {
                let countries =  try decoder.decode([Country].self, from: data)
                print(countries)
                completionHandler(countries, nil)
            } catch {
                print(error.localizedDescription)
            }
        }
        dataTask.resume()
    }
}

//class NetworkManager {
//    var delegate: NetworkManagerActions?
//    func getCountries() {
//        guard let url = URL(string:"https://gist.githubusercontent.com/peymano-wmt/32dcb892b06648910ddd40406e37fdab/raw/db25946fd77c5873b0303b858e861ce724e0dcd0/countries.json") else { return }
//        let urlSession = URLSession(configuration: URLSessionConfiguration.default)
//        var urlRequest = URLRequest(url: url)
//        urlRequest.httpMethod = "GET"
//        let dataTask = urlSession.dataTask(with: urlRequest) { data, response, error in
//            print(response ?? "Response not available")
//            print(error ?? "Error not available")
//            print(data ?? "Data not available")
//
//            guard let data = data else {
//                return
//            }
//
//            let decoder = JSONDecoder()
//            decoder.keyDecodingStrategy = .convertFromSnakeCase
//            do {
//                let countries =  try decoder.decode([Country].self, from: data)
//                print(countries)
//                self.delegate?.refresh(countries: countries)
//            } catch {
//                print(error.localizedDescription)
//            }
//        }
//        dataTask.resume()
//    }
//}
