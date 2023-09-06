import UIKit

var greeting = "Hello, playground"


// Generics

func add<T: Numeric>(a: T, b: T)-> T {
    return a + b
}

let sum = add(a: 5, b: 6.5)
print(sum)

