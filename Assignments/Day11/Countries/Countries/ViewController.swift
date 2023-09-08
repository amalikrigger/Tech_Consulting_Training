//
//  ViewController.swift
//  Countries
//
//  Created by MAC on 05/09/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
   
    @IBOutlet weak var tableView: UITableView!
    
    private var countries: [Country] = []
    private let networkManager = NetworkManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        networkManager.get(urlStr: "https://gist.githubusercontent.com/peymano-wmt/32dcb892b06648910ddd40406e37fdab/raw/db25946fd77c5873b0303b858e861ce724e0dcd0/countries.json", type: [Country].self) { result in
            switch result {
            case .success(let countries):
                self.countries = countries
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
        
        networkManager.get(urlStr: "https://reqres.in/api/users", type: [User].self) { result in
            switch result {
            case .success(let users):
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let country = countries[indexPath.row]
        cell.textLabel?.text = "\(country.name)"
    
        return cell
        
        
    }
}

