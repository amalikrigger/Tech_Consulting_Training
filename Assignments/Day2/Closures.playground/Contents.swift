import UIKit

var greeting = "Hello, playground"



var name: String = ""

func add(num1: Int)-> Int {
    return num1
}


var nameOfClosure:()-> Void = { print("I am closure")
}

// declaration
// body
// calling

nameOfClosure()

func add( sum:(Int, Int)-> Int ) {
   let value =   sum(2,3)
    print(value)
}


add { num1, num2 in
    return num1 + num2
}


func add (  ) {
    
}



///
 // create closure to multiple 3 numbers


var multiply:(Int, Int, Int)-> Int = { num1, num2, num3 in
    
    return num1 * num2 * num3
    
}



let output = multiply(2,3,4)

print(output)



// Short Hand Syntax



var multiply1:(Int, Int, Int)-> Int = {
    
    return $0 * $1 * $2
    
}


let output1 = multiply1(2,3,5)

print(output1)



// Type of properties


// Stored properties
// Computed properties
// lazy  properties
// Static  properties


var radius = 5

var diameter: Int {
   return radius * 2
}

print(diameter)

radius = 10

print(diameter)



// Static properties

class Student {
   static var count = 0
}

let s1 = Student()
Student.count = Student.count + 1

print(Student.count)

let s2 = Student()
Student.count = Student.count + 1

print(Student.count)
