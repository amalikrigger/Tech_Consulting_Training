//
//  HomeViewController.swift
//  Sample
//
//  Created by MAC on 24/08/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var loginButtton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func loginButtonTapped(_ sender: Any) {
       print("Login Button Action")
        print(userNameTextField.text)
        print(passwordTextField.text)

//        let userName = userNameTextField.text ?? ""
//
//        let password = passwordTextField.text ?? ""

//        if let userName = userNameTextField.text, let password = passwordTextField.text, userName == "admin"  && password == "admin" {
//                print("success")
//        } else {
//            print("failure")
//        }
//
     
        // if password is non nil , and username is non nil
        
        // if password/useranme = "admin" than print success otherwise print failure
        
        
        guard let userName = userNameTextField.text else {
            return
        }
        
        guard let password = passwordTextField.text else {
            return
        }
        
        if userName == "admin" && password == "admin" {
            print("success")
            
            self.performSegue(withIdentifier: "navigateToSearch", sender: nil)
        }else {
            print("failure")
        }
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
       let searchController =  segue.destination as? SearchViewController
        
        searchController?.userName = userNameTextField.text ?? ""
    }
    

}
