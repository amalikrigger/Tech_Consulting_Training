//
//  LoginViewController.swift
//  Day2Assignment
//
//  Created by Amali Krigger on 8/28/23.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButtonClicked(_ sender: Any) {
        guard let username = usernameTextField.text else {
            return
        }
        
        guard let password = passwordTextField.text else {
            return
        }
        
        if (username == "amali" && password == "admin") {
            print(username)
            print(password)
            self.performSegue(withIdentifier: "navigateToCalculator", sender: nil)
        } else {
            print("Failure")
        }
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let calculatorController = segue.destination as? CalculatorViewController
        
        calculatorController?.username = usernameTextField.text ?? ""
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
