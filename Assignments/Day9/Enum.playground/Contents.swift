import UIKit

var greeting = "Hello, playground"


enum Direction {
    case east(message: String) // associated values
    case west
    case north
    case south
}

enum Direction1: String {
    case east = "East"  // raw value
    case west = "West"
    case north = "North"
    case south = "South"
}


let driection = Direction.east(message:" I am going to east direction")


let driection1 = Direction1.east
print(driection1.rawValue)
