//
//  CountryViewController.swift
//  Day2Assignment
//
//  Created by Amali Krigger on 9/1/23.
//

import UIKit

class CountryViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var countryTableView: UITableView!
    var countries:[Country] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        countryTableView.dataSource = self
        getCountries()
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
    
    func getCountries() {
        guard let url = URL(string:"https://gist.githubusercontent.com/peymano-wmt/32dcb892b06648910ddd40406e37fdab/raw/db25946fd77c5873b0303b858e861ce724e0dcd0/countries.json") else { return }
        let urlSession = URLSession(configuration: URLSessionConfiguration.default)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        let dataTask = urlSession.dataTask(with: urlRequest) { data, response, error in
            print(response ?? "Response not available")
            print(error ?? "Error not available")
            print(data ?? "Data not available")
            
            guard let data = data else {
                return
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            do {
                let response = try decoder.decode([Country].self, from: data)
                self.countries = response
                print(self.countries)
                DispatchQueue.main.async {
                 self.countryTableView.reloadData()
                }
            } catch {
                print(error)
            }
        }
        dataTask.resume()
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

struct Country: Decodable {
    let capital:String?
    let code:String?
    let currency:Currency?
    let flag:String
    let language:Language
    let name:String
    let region:String
}

struct Currency: Decodable {
    let code:String
    let name:String
    let symbol:String?
}

struct Language: Decodable {
    let code:String?
    let name:String
}
