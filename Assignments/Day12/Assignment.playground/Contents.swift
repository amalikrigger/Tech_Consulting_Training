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
 
 10. Diff b/w let and var?
 - let is used to declare constants which are variables that are immutable. var is used to declare variables that are mutable.
 
 11. What are associated values?
 - Associated values serve as additional data that can be provided to each enum case. It is a feature of enums.
 
 12. Diff b/w associated values and raw values?
 - Enums can have multiple associated values of different types, but they can only have one constant raw value of a specific type.
 
 13. What is enum?
 - Enum is short for enumeration. It defines a set of predefined distinct values or cases. They define a group of related values as
 one named type making your code more readable, maintainable, and self explanatory.
 
 14. Can we add functions and variables in an Enum?
 - Yes you can add functions and variables, also known as properties, to an enum.
 
 15. What are computed properties?
 - A computed property is a property of a class, struct or enum that doesn't store a value correctly, but computes it's value
 dynamically when accessed. It is another way to encapsulate code logic. A computed property "area" can be defined when accessed
 by calculating itself from the provided radius stored property.
 
 16. What are stored properties?
 - Stored properties have a dedicated memory location to store their values. They are used to store and retrieve values from within
 instances of classes, structs and enums. They store and persist values through the lifetime of the instance.
 
 17. What are lazy properties?
 - Lazy properties are properties that are not calculated until accessed the first time. They are only initialized when they are first used
 and then their value is cached for future access. They are initialized using a closure.
 
 18. When to use lazy properties and when not to use lazy properties?
 - You should use lazy properties when the computation of a value is expensive to create and would be beneficial to only be computed when necessary. This
 allows the code to delay having to create the property until then. This is also useful when reading from a slow data source or if the property depends external resources that are not always available. Lazy properties help you to avoid unnecessary work and improve the performance of your code by delaying the creation of values until they are needed. It also eliminates the need for forced unwrapping or or optional binding. Don't use when the property has a low initialization cost because this can cause unnecessary complexity in your code.
 
 19. What are Static and Class properties?
 - Static and Class properties are used to define properties within a class, struct, or enum. Static properties are defined using the static keyword.
 Static properties are accessed directly from the type itself and not on instances of the type. Class properties are defined using the class keyword.
 They are accessed on instances of the type. They can be overriden by subclasses and participate in method overriding and static properties can't.
 
 20. What are differences between static and class?
 - Static properties or methods cannot be overriden in subclasses and classes can. Static properties and methods are accessed on the type itself only and classes are accessed on type and instances. There is no inheritance of static members but classes can be inherited and overriden by subclassed.
 
 21. What are the difference between class and struct?
 - Classes are reference types and structs are value types. Instances of classes are mutable by default, but structs are immutable by default. Classes
 support inheritance and structs do not. Classes are stored in heap memory and structs are stored in stack memory.
 
 22. Difference between value types and reference types?
 - When a reference type is assigned to another variable, you are creating another reference to the same object in memory. Changes made affect the same
 object in memory. When assigning a struct instance to another variable or pass it to a function, you create a copy of the original struct. Changes made
 to the copy do not affect the original instance
 
 23. When to use class or struct?
 - Classes are good for when you want mutability and structs are good for when you want immutability. Classes are good for when you need inheritance.
 Structs are more efficient.
 
 24. How to mutate struct?
 - You can mutate the properties of the struct by declaring an instance of it using var.
 
 25. Where are structs stored and where are classes stored?
 - structs are stored in stack memory and classes are stored in heap memory.
 
 26. Diff b/w stack and heap memory?
 - Stack memory operates in a last in first out (LIFO) fashion. A heap provides dynamic memory allocation.
 
 27. What are protocols?
 - Protocols are blueprints for methods that extend them. The classes, structs, or enums that adopt them must conform to a set of functions and properties
 to implement.
 
 28. Different use cases of Protocols?
 - Protocols can be used for a lot of various cases including the delegate pattern, datasource patter, and custom view controllers.
 
 29. Can we add variables inside Protocols?
 - Yes
 
 30. How to make a Protocol a functional Optional?
 - To do so you must use the objc and optional keyword.
 
 31. What are protocol extensions?
 - Protocol extensions allow you to provide default implementations for methods and properties defined in a protocol.
 
 32. Can we add stored properties in protocol extension?
 - You can't add stored properties directly to protocol extensions.
 
 33. Why can't we add stored properties to protocol extensions?
 - This would create an issue for value types because they don't allocate memory in the same way classes do. 
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
