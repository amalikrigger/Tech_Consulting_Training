//
//  ViewController.swift
//  RBSNews
//
//  RBS Tests Project on 12/10/20.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    var viewModel = LoginViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Login screen"
    }

    @IBAction func loginButtonTapped(_ sender: UIButton) {
        let result = viewModel.validateCredentials(userName: usernameTextField.text ?? "", password: passwordTextField.text ?? "")

        if result == nil {
            navigateToHomeScreen()
        }
        
        return
    }
   
    func navigateToHomeScreen() {
        if let newsViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "NewsViewController") as? NewsViewController {
            if let navigation = navigationController {
                navigation.pushViewController(newsViewController, animated: true)
            }
        }
    }
}

