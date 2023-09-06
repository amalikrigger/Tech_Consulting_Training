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
            self.performSegue(withIdentifier: "navigateToHome", sender: nil)
        } else {
            self.performSegue(withIdentifier: "navigateToHome", sender: nil)
            print("Login Failed or Skipped")
        }
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let uiTabBarController = segue.destination as? UITabBarController
        let homeController = uiTabBarController?.viewControllers?.first as? HomeViewController

        homeController?.username = usernameTextField.text ?? ""
    }
    

}
