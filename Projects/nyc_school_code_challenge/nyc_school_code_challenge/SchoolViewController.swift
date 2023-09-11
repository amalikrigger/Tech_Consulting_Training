//
//  SchoolViewController.swift
//  nyc_school_code_challenge
//
//  Created by Amali Krigger on 9/10/23.
//

import UIKit

class SchoolViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var schoolTableView: UITableView!
    let  viewModel = SchoolViewModel()
    var schools:[School] = []
    var sat:SAT?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        schoolTableView.dataSource = self
        schoolTableView.delegate = self
        viewModel.getSchools(completionHandler: { result in
            switch result {
            case .success(let schools):
                self.schools = schools
                DispatchQueue.main.async {
                    self.schoolTableView.reloadData()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schools.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? SchoolTableViewCell
        cell?.schoolName.text = schools[indexPath.row].schoolName
        return cell ?? UITableViewCell()
    }
            
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.getSAT(dbn: schools[indexPath.row].dbn, completionHandler: { result in
            switch result {
            case .success(let sat):
                DispatchQueue.main.async {
                    self.sat = sat
                    self.performSegue(withIdentifier: "navigateToSAT", sender: nil)
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let satViewController = segue.destination as? SATViewController
        guard let sat = self.sat else {
            return
        }
        satViewController?.schoolName = sat.schoolName
        satViewController?.mathSAT = sat.satMathAvgScore
        satViewController?.readingSAT = sat.satCriticalReadingAvgScore
        satViewController?.writingSAT = sat.satWritingAvgScore
    }
}
