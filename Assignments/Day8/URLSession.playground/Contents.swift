import UIKit

var greeting = "Hello, playground"



class UrlSession  {
    
    func getDataTask(request: URLRequest, comletionHandler:(Data?, String?)-> Void) {
        
        // code to call api to get
        
        
    }
    
    func resume() {
        comletionHandler(Data(), nil)
    }
    
}


class ViewController {
    
    
    func getUsers() {
        
        let session = UrlSession()
        
        guard let url = URL(string:"some url") else { return }
        
        let request = URLRequest(url: url)
        
        session.getDataTask(request: request) { data, error in
            
        }
        
        
        let urlSession = URLSession(configuration: URLSessionConfiguration.default)
        
        
        let dataTask = urlSession.dataTask(with: request) { data, response, error in
            
            
            let decoder = JSONDecoder()
            
           let reponse = try? decoder.decode(Reponse.self, from: data)
        }
        
        //dataTask.resume()
    }
    
}
