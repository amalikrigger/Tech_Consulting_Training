//
//  ViewController.swift
//  Countries
//
//  Created by MAC on 05/09/23.
//

import UIKit

protocol ViewControllerProtocol {
   func refreshUI()
}

class ViewController: UIViewController, UITableViewDataSource {
   
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = CountryViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        tableView.dataSource = self
        viewModel.getCountries()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let country = viewModel.countries[indexPath.row]
        cell.textLabel?.text = "\(country.name)"
    
        return cell
        
        
    }
}

extension ViewController: ViewControllerProtocol {
    func refreshUI() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
