import UIKit
import Foundation

var greeting = "Hello, playground"


protocol Playable {
   func pause()
   func play()
   func resume()
}

protocol ForwardBackActions {
    func back()
    func forward()
}

extension ForwardBackActions {
    func back() {}
    func forward() {}
}
extension Playable {
    func pause() {

    }
    func play() {
      print("Play")
    }
    func resume() {

    }
}

typealias PhilipsActions = Playable & ForwardBackActions

class Philips: PhilipsActions {

}

let p1 = Philips()

p1.play()
p1.back()

class Apple: Playable {
    func play() {
      print("Play1")
    }
}

let a1 = Apple()
a1.play()

print("abc")


// Protocol extension is used to give default behavour to protocol methods



// Type Alias

let name: String

typealias StringType = String

let marks: StringType




// Initlizers
// Protocol Extensions
// Type Alias


