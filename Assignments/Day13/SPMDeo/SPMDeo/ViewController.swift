//
//  ViewController.swift
//  SPMDeo
//
//  Created by MAC on 11/09/23.
//

import UIKit
import CoreNetworkModule
import Alamofire

class ViewController: UIViewController {

    let core = NetWorkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        AF.request("https://reqres.in/api/users")
            .response { response in
        debugPrint(response)
        }
        
        
        AF.request("https://reqres.in/api/users").responseDecodable(of: Reponse.self) { response in

            debugPrint(response)
        }
                   
                   
      
    }


}

struct Reponse : Decodable {
    let user: [User]
}

struct User: Decodable {
    let email: String
}

extension NetWorkManager {
    func decode() {
        
    }
}

class MyNetworkManager: NetWorkManager {
    
    
}
