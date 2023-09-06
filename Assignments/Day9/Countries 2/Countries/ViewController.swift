//
//  ViewController.swift
//  Countries
//
//  Created by MAC on 05/09/23.
//

import UIKit


protocol NetworkManagerActions {
    func refresh(countries: [Country])
}

class ViewController: UIViewController, UITableViewDataSource, NetworkManagerActions {
   
    @IBOutlet weak var tableView: UITableView!
    
    private var countries: [Country] = []
    private let networkManager = NetworkManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        networkManager.delegate = self
        networkManager.getCountries()
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
    
    func refresh(countries: [Country]) {
        
        self.countries = countries
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
       
    }
    
  
    
}

