//
//  CountryViewModel.swift
//  Day2Assignment
//
//  Created by Amali Krigger on 9/12/23.
//

import Foundation

class CountryViewModel {
    private(set) var countries: [Country] = []
    private var countriesList: [Country] = []
    private let networkManager = NetworkManager()
    var delegate: CountryTableViewProtocol?
    func getSchools(completionHandler:@escaping (Result<String, Error>) -> Void) {
        networkManager.get(urlString: "https://gist.githubusercontent.com/peymano-wmt/32dcb892b06648910ddd40406e37fdab/raw/db25946fd77c5873b0303b858e861ce724e0dcd0/countries.json", type:
                            [Country].self) { result in
            switch result {
            case .success(let countries):
                self.countriesList = countries
                self.countries = countries
                completionHandler(.success("Successfully retrieved countries"))
            case .failure(let error):
                print(error.localizedDescription)
                completionHandler(.failure(error))
            }
        }
    }
    
    func filterCountries(searchText:String) {
        countries = countriesList.filter { $0.name.lowercased().prefix(searchText.count) == searchText.lowercased()
        }
    }
    
    func deleteCountry(index:Int) {
        countriesList.remove(at: index)
        countries = countriesList
        delegate?.refreshTable()
    }
    
    func setup() {
        getSchools(completionHandler: { result in
            switch result {
            case .success(let res):
                print(res)
                self.delegate?.refreshTable()
            case .failure(let error):
                print(error.localizedDescription)
                self.delegate?.showError(message: error.localizedDescription, buttonText: "Ok")
            }
        })
    }
}
