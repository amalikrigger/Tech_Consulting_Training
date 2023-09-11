//
//  SchoolViewModel.swift
//  nyc_school_code_challenge
//
//  Created by Amali Krigger on 9/10/23.
//

import Foundation

class SchoolViewModel {
    private(set) var schools: [School] = []
    private let networkManager = NetworkManager()
    
    func getSchools(completionHandler:@escaping (Result<[School], Error>) -> Void) {
        networkManager.get(urlString: "https://data.cityofnewyork.us/resource/s3k6-pzi2.json", type:
                            [School].self) { result in
            switch result {
            case .success(let schools):
                self.schools = schools
                completionHandler(.success(self.schools))
            case .failure(let error):
                print(error.localizedDescription)
                completionHandler(.failure(error))
            }
        }
    }
    
    func getSAT(dbn:String, completionHandler:@escaping (Result<SAT?, Error>) -> Void) {
        networkManager.get(urlString: "https://data.cityofnewyork.us/resource/f9bf-2cp4.json", type:
                            [SAT].self) { result in
            switch result {
            case .success(let sats):
                let sat = sats.first(where: {$0.dbn == dbn})
                completionHandler(.success(sat))
//                for sat in sats {
//                    if (sat.schoolName == schoolName) {
//                        completionHandler(.success(sat))
//                        break;
//                    }
//                }
            case .failure(let error):
                print(error.localizedDescription)
                completionHandler(.failure(error))
            }
        }
    }
}
