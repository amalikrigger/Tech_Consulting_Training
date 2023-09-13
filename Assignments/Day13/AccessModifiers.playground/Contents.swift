import UIKit

var greeting = "Hello, playground"


// 5 Access modifiers

// 1. Open
      // In other module we can extend or inherit Open level access modifiers
// 2. Public
   // In other module we can't extend or inherit Open level access modifiers
// 3. Internal
    // can be accessed in same module not in different modules
// 4. FilePrivate
// 5. Private
     // can't be accessed outside of class

class LoginViewModel {
   fileprivate var userName: String = ""
    
}

let viewModel = LoginViewModel()

viewModel.userName


// Adding 3rd party dependecies in projet

// 1. Using SPM (Swift Package Manager)
// 2. Using Cocoa pods
// 3. Using Carthage





