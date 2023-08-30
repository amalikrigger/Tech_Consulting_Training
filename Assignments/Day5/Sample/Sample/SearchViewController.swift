//
//  SearchViewController.swift
//  Sample
//
//  Created by MAC on 28/08/23.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    
    var userName = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        welcomeLabel.text = "Welcome \(userName)"
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
