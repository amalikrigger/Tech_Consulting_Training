//
//  CountryViewController.swift
//  Day2Assignment
//
//  Created by Amali Krigger on 9/1/23.
//

import UIKit

protocol NetworkManagerActions {
    func refresh(countries: [Country])
}

class CountryViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {
//class CountryViewController: UIViewController, UITableViewDataSource, NetworkManagerActions {
    @IBOutlet weak var countrySearchBar: UISearchBar!
    @IBOutlet weak var countryTableView: UITableView!
    private var countries: [Country] = []
    private var searchedCountries: [Country] = []
    var searching = false
    private let networkManager = NetworkManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        countryTableView.dataSource = self
        self.countrySearchBar.delegate = self
//        networkManager.delegate = self
        networkManager.getCountries {countries, error in
            
            guard let countries = countries else {
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
                return
            }
            self.countries = countries
            DispatchQueue.main.async {
                self.countryTableView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return searchedCountries.count
        } else {
            return countries.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let countryCell = tableView.dequeueReusableCell(withIdentifier: "countryCell") as? CountryTableViewCell
        
        if searching {
            countryCell?.countryNameLabel.text = searchedCountries[indexPath.row].name
            countryCell?.capitalLabel.text = searchedCountries[indexPath.row].capital
            countryCell?.regionLabel.text = searchedCountries[indexPath.row].region
            countryCell?.countryCodeLabel.text = searchedCountries[indexPath.row].code
        } else {
            countryCell?.countryNameLabel.text = countries[indexPath.row].name
            countryCell?.capitalLabel.text = countries[indexPath.row].capital
            countryCell?.regionLabel.text = countries[indexPath.row].region
            countryCell?.countryCodeLabel.text = countries[indexPath.row].code
        }

        return countryCell ?? UITableViewCell()
    }
    
    func refresh(countries: [Country]) {
        self.countries = countries
        
        DispatchQueue.main.async {
            self.countryTableView.reloadData()
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchedCountries = countries.filter { $0.name.lowercased().prefix(searchText.count) == searchText.lowercased()
        }
        searching = true
        DispatchQueue.main.async {
            self.countryTableView.reloadData()
        }
    }
        
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        DispatchQueue.main.async {
            self.countryTableView.reloadData()
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


