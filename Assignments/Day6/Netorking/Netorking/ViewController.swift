//
//  ViewController.swift
//  Netorking
//
//  Created by MAC on 30/08/23.
//

import UIKit

class ViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        readLocalFile()
    }
    
    func readLocalFile() {
        
        guard let url =  Bundle.main.url(forResource:"Users", withExtension:"json") else { return }
        
        print(url)

        do  {
            let data = try Data(contentsOf: url)
            
            
            let decoder = JSONDecoder()
            
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
           let response =  try decoder.decode(Resonse.self, from: data)
            
            
        
            print(response)
            
        } catch {
            print(error)
        }
        
    }
    
    
    

    override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }
}

