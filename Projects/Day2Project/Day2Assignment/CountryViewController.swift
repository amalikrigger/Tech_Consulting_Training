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

class CountryViewController: UIViewController, UITableViewDataSource {
//class CountryViewController: UIViewController, UITableViewDataSource, NetworkManagerActions {
    @IBOutlet weak var countryTableView: UITableView!
    private var countries: [Country] = []
    private let networkManager = NetworkManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        countryTableView.dataSource = self
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
        print("Count: " + countries.count.formatted())
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let countryCell = tableView.dequeueReusableCell(withIdentifier: "countryCell") as? CountryTableViewCell
        
        countryCell?.countryNameLabel.text = countries[indexPath.row].name
        countryCell?.capitalLabel.text = countries[indexPath.row].capital
        countryCell?.regionLabel.text = countries[indexPath.row].region
        countryCell?.countryCodeLabel.text = countries[indexPath.row].code
        
        return countryCell ?? UITableViewCell()
    }
    
    func refresh(countries: [Country]) {
        self.countries = countries
        
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


