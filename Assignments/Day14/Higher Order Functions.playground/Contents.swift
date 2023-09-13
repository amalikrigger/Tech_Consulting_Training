import UIKit

var greeting = "Hello, playground"



// input
let nums = [1,2,3,4,5]

// Ouput
[5, 10, 15, 20, 25]

var output:[Int] = []

for num in nums {
    output.append(num * 5)
}

print(output)

//**********
// map : iterate through each elment in array and return  modified values as array


//let result = nums.map { num in
//    num * 6
//}

let result = nums.map { $0 * 6 }
print(result)


let stringNumbers = ["1", "2", "3", "5", "abc"]


let intNumbers = stringNumbers.map { num in
    Int(num)
}

print(intNumbers)


// ********

// compactMap : will unwrap optionals and remove nil value from final result array , very similler to map only.


let intNumbers1 = stringNumbers.compactMap { num in
    Int(num)
}
print(intNumbers1)


// ********

// flatmap

//
let input = [[1,2], [3,4], [5,6]]

//for numbers in input {
//    for num in numbers {
//        print(num)
//    }
//}


let x = input.flatMap { $0 }

print(x)

// Reduce



// input
let nums1 = [1,2,3,4,5, 6]

// output = 15

var sum = 0
for num in nums1 {
   sum = sum + num
}

print(sum)

let sum1  = nums1.reduce(0) { partialResult, value in
    return partialResult + value
}

print(sum1)


// output = 120

let mul = nums1.reduce(1) { return $0 * $1 }

print(mul)


// Filter

// input
var nums2 = [1,2,3,4,5, 6]

// [2,4,6]
var evenNumbers: [Int] = []
for num in nums2 {
    if num % 2 == 0 {
        evenNumbers.append(num)
    }
}
print(evenNumbers)

let evens = nums2.filter { $0 % 2 == 0 }

print(evens)


// Sort

nums2.sort { $0 > $1}

print(nums2)


// Sorted

let num3 = [6,3,1,5,10,9]
let num4 = num3.sorted { $0 > $1}

print(num3)
print(num4)


//

// 1 1  2  3  5  8  13  21  34 .....


// input : a gvien number from fibonicee series like 5
// size of fibnocie , starting gvien fib number = 4

// [5 , 8 , 13, 21]


//  input  8 ,  3
//  output = [8 , 13,  21 ]


// do this using higher order function

//func fibonacci(start:Int, iterations:Int) -> [Int]{
//    var result:[Int] = []
//    var n = 1
//    var ans = 1
//    while result.count < iterations {
//        if n == 1 {
//
//        }
//    }
//}
//
//var ans = 1
//var t = [1, 2, 3, 4].reduce(1, { pr, r in
//    ans = pr + ans
//    return ans
//})
//
//print(t)



output = []

func fib(_ n: Int) -> Int {
    guard n > 1 else { return n}
    return fib(n - 1) + fib(n - 2)
}

print(fib(1))

var i = 0;
var c:[Int] = []
while output.count < 4 {
    var a = fib(i)
    if(a >= 5)
    {
        output.append(a)
    }
    c.append(a)
    i += 1
}

print(c)
print(output)


