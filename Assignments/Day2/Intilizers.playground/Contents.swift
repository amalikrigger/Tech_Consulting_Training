import UIKit

var greeting = "Hello, playground"

// Intilizers (Constructurs)


class Student {
    let name: String
    let age: Int
    var address: String
    
    init(_name: String, _age: Int, _address: String) {
      name = _name
      age = _age
      address = _address
    }
    
    init(_name: String, dob: String) {
      name = _name
      age =  2// logic to calulae age based upon dob
        address = ""
    }
    
}


let s1 = Student(_name: "", _age: 1, _address: "")
//
//
let s2 = Student(_name:"Orange", dob:"22/12/2023")


// body
//


// Designated intilizers
// Convienece intilizers



