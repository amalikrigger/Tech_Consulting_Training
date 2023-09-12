//
//  CountryViewController.swift
//  Day2Assignment
//
//  Created by Amali Krigger on 9/1/23.
//

import UIKit

protocol CountryTableViewProtocol {
    func refreshTable()
    func showError(message:String, buttonText:String)
}

class CountryViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate, CountryTableViewProtocol {
    @IBOutlet weak var countrySearchBar: UISearchBar!
    @IBOutlet weak var countryTableView: UITableView!
    private let networkManager = NetworkManager()
    let viewModel = CountryViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        countryTableView.dataSource = self
        countrySearchBar.delegate = self
        viewModel.delegate = self
        viewModel.setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let countryCell = tableView.dequeueReusableCell(withIdentifier: "countryCell") as? CountryTableViewCell
        
        countryCell?.countryNameLabel.text = viewModel.countries[indexPath.row].name
        countryCell?.capitalLabel.text = viewModel.countries[indexPath.row].capital
        countryCell?.regionLabel.text = viewModel.countries[indexPath.row].region
        countryCell?.countryCodeLabel.text = viewModel.countries[indexPath.row].code
        countryCell?.index = indexPath.row
        countryCell?.viewModel = viewModel
        return countryCell ?? UITableViewCell()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.filterCountries(searchText: searchText)
        DispatchQueue.main.async {
            self.countryTableView.reloadData()
        }
    }
        
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        DispatchQueue.main.async {
            self.countryTableView.reloadData()
        }
    }
    
    func refreshTable() {
        DispatchQueue.main.async {
            self.countryTableView.reloadData()
        }
    }
    
    func showError(message:String, buttonText:String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: buttonText, style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
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


