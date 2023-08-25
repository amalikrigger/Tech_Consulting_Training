//
//  AppDelegate.swift
//  Sample
//
//  Created by MAC on 24/08/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        let p1 = Philips()

        p1.play()
        
        let a1 = Apple()
        a1.play()

        print("abc")
        
        
        return true
    }
}



protocol Playable {
   func pause()
   func play()
   func resume()
   func back()
   func forward()
}

extension Playable {
    func back() {

    }

    func forward() {

    }

    func pause() {

    }
    func play() {
      print("Play")
    }
    func resume() {

    }
}

class Philips: Playable {

}




class Apple: Playable {
//    func play() {
//      print("Play1")
//    }
}


