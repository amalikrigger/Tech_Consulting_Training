//
//  ProductViewController.swift
//  Day2Assignment
//
//  Created by Amali Krigger on 8/30/23.
//

import UIKit

class ProductViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var productTableView: UITableView!
    
    var products:Products = Products(products: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productTableView.dataSource = self
        readLocalFile()
    }
    
    func readLocalFile() {
        guard let url =  Bundle.main.url(forResource:"Products", withExtension:"json") else {
            return
        }
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let response =  try decoder.decode(Products.self, from: data)
            print(response)
            products = response
        } catch {
            print(error)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as? ProductTableViewCell
        let product = products.products[indexPath.row]
        cell?.titleLabel.text = "\(product.title)"
        cell?.descriptionLabel.text = "\(product.description)"
        cell?.priceLabel.text = "$\(String(product.price))"
        cell?.discountLabel.text = "\(String(product.discountPercentage))%"
        cell?.ratingLabel.text = "\(String(product.rating))"
        cell?.stockLabel.text = "\(String(product.stock))"
        cell?.brandLabel.text = "\(product.brand)"
        cell?.categoryLabel.text = "\(product.category)"
        return cell ?? UITableViewCell()
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

struct Product: Decodable {
    let id:Int
    let title:String
    let description:String
    let price:Double
    let discountPercentage:Double
    let rating:Double
    let stock:Int
    let brand:String
    let category:String
    let thumbnail:String
    let images:[String]
    
//    init(id:String, title:String, description:String, price:Double, discountPercentage:Double, rating:Double, stock:Int, brand:String, category:String, thumbnail:String, images:[String]) {
//        self.id = id
//        self.title = title
//        self.description = description
//        self.price = price
//        self.discountPercentage = discountPercentage
//        self.rating = rating
//        self.stock = stock
//        self.brand = brand
//        self.category = category
//        self.thumbnail = thumbnail
//        self.images = images
//    }
    
}

struct Products: Decodable {
    let products: [Product]
}


