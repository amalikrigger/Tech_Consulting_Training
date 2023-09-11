//
//  SATViewController.swift
//  nyc_school_code_challenge
//
//  Created by Amali Krigger on 9/10/23.
//

import UIKit

class SATViewController: UIViewController {
    @IBOutlet weak var schoolNameLabel: UILabel!
    @IBOutlet weak var writingSATLabel: UILabel!
    @IBOutlet weak var mathSATLabel: UILabel!
    @IBOutlet weak var readingSATLabel: UILabel!
    
    var schoolName = ""
    var writingSAT = ""
    var mathSAT = ""
    var readingSAT = ""
    var sat:SAT?
    override func viewDidLoad() {
        super.viewDidLoad()
        schoolNameLabel.text = "School Name: \(schoolName)"
        writingSATLabel.text = "Writing SAT Avg Score: \(writingSAT)"
        readingSATLabel.text = "Reading SAT Avg Score: \(readingSAT)"
        mathSATLabel.text = "Math SAT Avg Score: \(mathSAT)"
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
