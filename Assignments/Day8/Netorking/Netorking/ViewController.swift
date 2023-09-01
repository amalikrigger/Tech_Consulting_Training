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
        getUsers()
    }
    
    
    func getUsers() {
        
      // https://reqres.in/api/users
        
        // www.serverName.com/
        //login?userName=asdfads&password=adfasd
        ///products
        ///product?keyworkd=iPhone
        ///
        
        
           // BaseURL
//Request  // Path
           // parameter
        
           // requestType (httpMethod) ->
                           //C  -> Create = "POST"
                            //R ->  Read  = "GET"
                            //U ->  Update = "PUT"
                             //D -> Delete = "DELETE"
        
          // Header
        
        // Response -> Json
        // Status code
        guard let url = URL(string:"https://reqres.in/api/users") else {
            return
        }
        var urlRequest =  URLRequest(url: url)
        
        urlRequest.httpMethod = "GET"
        
       let urlSession = URLSession(configuration: URLSessionConfiguration.default)
        
        let dataTask =  urlSession.dataTask(with: urlRequest) { data, response, error in
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let response =  try? decoder.decode(Resonse.self, from: data)
            print(response)
        }
        dataTask.resume()
        
        // declaration
        // body
        // calling
    }
    
    func dataTask(completoin:(Data?)-> Void) {
        completoin(Data())
    }
    
    func readLocalFile() {
        
        dataTask { data in
           print("asdfas")
        }
        
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

