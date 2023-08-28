import UIKit

var greeting = "Hello, playground"


//protocol CartErrorActions {
//    func showError()
//}
//
//class Car: CartErrorActions {
//    var engineObj: Engine?
//    func start() {
//        engineObj = Engine(car: self)
//        engineObj?.startEngine()
//
//    }
//    func showError() {
//
//    }
//}
//
//
//class Engine {
//    let delegate: CartErrorActions
//    init(car: CartErrorActions) {
//        self.delegate = car
//    }
//    func startEngine() {
//        print("Starting Engine")
//        //car.start()
//    }
//
//    func engineIssue() {
//       car.showError()
//    }
//}
//
//
//let car = Car()
//car.start()


// use closures


// protcol delegate pattern



// Abstraction
// retain Cycle


// using Closure


class Car {
    let engineObj = Engine()
    func start() {
        engineObj.startEngine()
        engineObj.callBack = {
            print("callBack")
            self.showError()
        }
    }
    func showError() {
        
    }
}
class Engine {
    var callBack:(()-> Void )?
   
    func startEngine() {
        print("Starting Engine")
    }
    func engineIssue() {
        callBack?()
    }
}


let car = Car()
car.start()
