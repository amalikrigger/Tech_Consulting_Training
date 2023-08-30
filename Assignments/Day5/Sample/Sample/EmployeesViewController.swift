//
//  EmployeesViewController.swift
//  Sample
//
//  Created by MAC on 29/08/23.
//

import UIKit

class EmployeesViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? EmployeeTableViewCell
        
        
        cell?.emailLbl.text = "email\(indexPath.row)@gmail.com"
        cell?.nameLbl.text = "Employee \(indexPath.row)"

        
        
        return cell ?? UITableViewCell()
    }
    

}
