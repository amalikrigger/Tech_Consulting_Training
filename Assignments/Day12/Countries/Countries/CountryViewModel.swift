//
//  CountryViewModel.swift
//  Countries
//
//  Created by MAC on 08/09/23.
//

import Foundation


class CountryViewModel  {    
    private(set) var countries: [Country] = []
    private let networkManager = NetworkManager()
    var delegate: ViewControllerProtocol?

    func getCountries() {
        networkManager.get(urlStr: "https://gist.githubusercontent.com/peymano-wmt/32dcb892b06648910ddd40406e37fdab/raw/db25946fd77c5873b0303b858e861ce724e0dcd0/countries.json", type: [Country].self) { result in
            switch result {
            case .success(let countries):
                self.countries = countries
                self.delegate?.refreshUI()
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }
}
