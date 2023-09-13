import UIKit
import Foundation

// There are 3 ways to do multi threading in iOS

  // 1. GCD (Grand Central Dispatch)
 //  2. Operation Queue
 //  3. Async Await


// GCD -> its there from start of iOS, its build on top of C.

  // GCD provides 2 queues by defualt

     // 1. Main Queue : will run code in main thread and its a serial queue

     // 2. Global Queue : will run code in background thread and its a Concurrent queue


// 1. Main Queue
//print("-1")

DispatchQueue.main.async {
    
}

// 2. Global Queue
DispatchQueue.global().async {
    
}


let mainQ = DispatchQueue.main


let globlQ = DispatchQueue.global()


//mainQ.async {
//    print("21")
//}

//print("11")
//
//globlQ.async {
//    print("1")
//}
//
//print("12")
//
//globlQ.async {
//    print("2")
//}

//mainQ.async {
//    print("22")
//}
//globlQ.async {
//    print("2")
//}
//globlQ.async {
//    print("3")
//}
//mainQ.async {
//    print("23")
//}
//globlQ.async {
//    print("4")
//}
//globlQ.async {
//    print("5")
//}
//globlQ.async {
//    print("6")
//}
//globlQ.async {
//    print("7")
//}
//mainQ.async {
//    print("24")
//}
//globlQ.async {
//    print("8")
//}
//globlQ.async {
//    print("9")
//}
//globlQ.async {
//    print("10")
//}
//mainQ.async {
//    print("25")
//}
//globlQ.async {
//    print("11")
//}
//
//print("0")


// Custom Queues

   // 1. Serail q
   // 2. Concurrent Q


let sq = DispatchQueue(label: "my serial q")

sq.async {
    print("1")
}


sq.async {
    print("2")
}


sq.async {
    print("3")
}



let cq = DispatchQueue(label: "", attributes: .concurrent)
cq.async {
    print("11")
}
cq.async {
    print("12")
}
cq.async {
    print("13")
}


// QOS (Quality of service)


let globalQueue = DispatchQueue.global(qos: .background)
// 5 type of QOS -> denotes priority

 // 1. UserInteractive
 // 2. User Initiated
 // 3. Defualt
//  4. Utility
 // 5. Background
