import UIKit



//1. consume below contries URL , get data and display in UI , display Name Of country , capital and Currency.  // do uisng URLSesson to call API

//  https://gist.githubusercontent.com/peymano-wmt/32dcb892b06648910ddd40406e37fdab/raw/db25946fd77c5873b0303b858e861ce724e0dcd0/countries.json


// 2. Parse the product.json , json is shared separately.

struct Product: Decodable {
    let productId:String
    let productName:String
    let shortDescription:String
    let price:Double
    let productImage:String
    let inStock:Bool?
    let reviewRating:Double?
    let reviewCount:Int?
}

func readLocalFile() {
    guard let url =  Bundle.main.url(forResource:"products", withExtension:"json") else {
        return
    }
    do {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response =  try decoder.decode([Product?].self, from: data)
        print(response)
    } catch {
        print(error)
    }
}

readLocalFile()




