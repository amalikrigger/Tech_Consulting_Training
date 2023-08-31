import UIKit

var greeting = "Hello, playground"


// Error handling using try catch , throw

// App States

// App lifce cycle methods

// View Controller life cycle methods

// Inheritance

// Networking

//===================================

// Error handling using try catch , throw

// throw , throws ,  do try catch

enum CustomError: Error {
    case divideByZero
}

func divide(num1: Double, num2: Double) throws -> Double {
    
    if num2 == 0 {
        throw CustomError.divideByZero
    }
    return num1/num2
}

do {
    let output = try divide(num1: 10.0, num2: 0.0)
    print(output)

} catch {
   print(error)
}


let output = try! divide(num1: 10.0, num2: 2.0)
print(output)


// 1. do try catch
// 2. try?
// 3. try!

// Assignment

// Create a class for which you should be able to create only 3 objects ,if more 3 object is created than throw an error



//===================================

// App States

// 5 states

  // 1. Not running
  // 2. In active
  // 3. Active
  // 4. Background
  // 5. Suspended



// App life cycle methods

//didFinishLaunchingWithOptions
//sceneWillEnterForeground
//sceneDidBecomeActive
//
//sceneWillResignActive
//sceneDidEnterBackground


// View Controller life cycle methods


//viewDidLoad
//viewWillAppear
//viewDidAppear
//viewWillDisappear
//viewDidDisappear

// ==============


// Inheritance

class GrandParent{
    
}

class SuperGrandParent {
    
}


class Human: GrandParent {
    
    func walk() {
        print("Parent walk")
    }
}


class Woman: Human {
    
    override func walk() {
        super.walk()
        print("child walk")
    }
}

let w1 = Woman()

w1.walk()


// Type of inheritance

  // 1. Single Inheritance
  // 2. Multi level inheritance
  // 3. Multiple inheritance



// =============

   //  Mobile App -> Server -> Database


   // JSON



struct User {
    var name: String
    
    func doSomething() {
        name = "Apple"
    }
    
}
