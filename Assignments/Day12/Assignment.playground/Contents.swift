import UIKit

var greeting = "Hello, playground"


// Ongoing class assingments (FROM RBS news)

 // 1. refactor loginViewController to MVVM and write tests
 // 2. Refactor NewsViewController to MVVM and write tests

// 3. Convert Calculator APP To MVVM and write tests for ViewModel

/*
 1. What are Optionals?
 - Optionals are properties or values that may or may not have a value. They can be nil.
 
 2. Different ways to safely unwrap Optionals?
 - Optional binding, Optional unwrapping (if let & guard let), Nil Coalescing (?? operator), and Optional Chaining (student?.name)
 
 3. Diff b/w if let and guard let?
 - if let is used to unwrap an Optional variable or property and provide a new variable within that scope. guard let is used for
 early exit or validation in functions or methods. It checks if an Optional contains a non-nil value and assigns it to a new
 constant or varible. If it is nil then it returns.
 
 4. What is Optional Chaining?
 - Optional Chaining is used to access properties of an Optional without having to unwrap it. You can safely access properties, methods
 or subscripts of an Optional without having to do a bunch of conditional checks.
 
 5. What is Force Unwrapping?
 - Force Unwrapping is using the "!" symbol at the end of a variable, property, or method to unwrap the Optional when you know that it
 will not be nil.
 
 6. Give an example where you can use Force Unwrapping?
 - In a case where you know the variable, property or method won't be nil. For example; If you return a value from a method that can
 return String or nil, when you try to use the variable returned you will need to unwrap it; however, if you nil coalesce the returned
 value, then you know that the value will never return nil. So when you using the returned value you can Force Unwrap it for convenience.
 
 7. What are Optionals behind the scene?
 - Behind the scenes an Optional is an enum with a value. It can be a wrapped value or the absence of a value.
 
 8. Diff b/w nil and null?
 - They are both terms used in different languages to represent the absence of a value. javascript, Java, and C# uses null and Swift uses
 nil.
 
 9. What is the nil coalescing operator?
 - The nil coalescing operator is the "??" symbol. It is used to provide a default value in case the variable, property, or method is nil.
 (return stringVariable ?? "")
 */



Optionals
    1    What is Optionals
    2    Different wasy to safely unwrap Optionals
    3    Diff b/w If let and Guard let
    4    What is Optional Chaining
    5    What is  Force Unwrapping
    6    Give an example where you can use Force Unwrapping
    7    What is Optionals behind the scene
    8    Diff b/w nil and NULL
    9    What is nil Colasing operator
    10    Diff b/w let and var
ENUM    11    What is enum
    12    What is associated values
    13    Diff b/w associated values and raw value
    14    Can we add functionss and variables  in Enum
Properties     15    What is Computed Properties
    16    What is Stored Properties
    17    What is Lazy  Properties
    18    When to use Lazy and when to not use Lazy properties
    19    What is Static and Class  Properties
    20    Diff b/w static and class
Class/ Struct
    21    Diff b/w Class and Struct
    22    Diff b/w Value types vs Refrence Types
    23    When you will use class vs Struct
    24    How to mutate Struct
    25    Where Structs are stored and where classes are Stored
    26    Diff b/w Stack and Heap Memory
Protocol
    27    What is Protocols
    28    Different Use Cases of Protocols
    29    Can we add variables inside Protocols
    30    How to make protocol functional Optional
    31    What is protocol Extensions
    32    Can we add Stored Properties in Protcool Extension
    33    Why We can't add Stored Properties in Protocol Extension
