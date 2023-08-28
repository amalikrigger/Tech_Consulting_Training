
//1 . Given an input array find 2nd maximum number from array

// Input  =  [1,2,4,6,7,8,9,10,3,4,6]
// output =  9

print("Question 1")
print("\n")

func findSecondLargestNum(list: [Int]) -> Int? {
    guard !list.isEmpty else {
        return nil // No elements in the array
    }
    var max = Int.min
    var secondMax = Int.min
    for num in list {
        if num > max {
            secondMax = max
            max = num
        } else if num > secondMax && num != max {
            secondMax = num
        }
    }
    return secondMax != Int.min ? secondMax : nil
}

let inputs:[[Int]] =
[
    [2, 7, 11, 15],
    [1, 2],
    [5, 5, 5, 5],
    [8, 5, 2, 11, 20],
    [10, 20, 30],
    [-5, -10, -3],
    [0, 0, 0, 0],
    [3, 5, 5, 10],
    [6],
    [],
    [-15, -10, -5, 0, 5, 10, 15],
    [100, -200, 150, -50],
    [100, 50, 150],
    [99, 99, 99, 99],
    [Int.min, 0, Int.max]
]

for input in inputs {
    print(input)
    if let secondLargestNum = findSecondLargestNum(list: input) {
        print("Second largest number: \(secondLargestNum)")
    } else {
        print("No second largest number found.")
    }
    print("\n")
}


//2; given input array and and a target number , find the combination of 2 numbers whose sum is equal to target number


 // input = [1,2,4,6, 0]  , Target Number = 5
 // output = [1,4]

func findTargetNums(list:[Int], target:Int)-> [Int]? {
    var numSet = Set<Int>()
    for num in list {
        let compliment = target - num
        if (numSet.contains(compliment)){
            return [compliment, num]
        }
        numSet.insert(num)
    }
    return nil
}

print("*****************************************************")
print("\n")

print("Question 2")
print("\n")

let input = [1,2,4,6,0]
let targets:[Int] = [3, 5, 9, 7, 1, 85, 6, 8, 2, 10, 4, 6, 20]
print("Input = [1,2,4,6,0]")
print("\n")
for target in targets {
    print("Target: \(target)")
    if let targetNums = findTargetNums(list: input, target: target) {
        print("Target nums: \(targetNums)")
    } else {
        print("No solution")
    }
    print("\n")
}

print("*****************************************************")
print("\n")

//// 3. Coding Challange PDF

print("Question 3")
print("\n")
var instructionsString = "5 3\n1 1 E\nRFRFRFRF\n3 2 N\nFRRFLLFFRRFLL\n0 3 W\nLLFFFLFLFL"

class Robot {
    var orientation: String
    var position: [Int]
    var grid: Grid
    var lost = false
    
    init(orientation: String, position: [Int], grid: Grid) {
            self.orientation = orientation
            self.position = position
            self.grid = grid
    }
    
    private func move(direction: Character) {
        switch direction {
        case "F":
            moveForward()
        case "R":
            turnRight()
        case "L":
            turnLeft()
        default:
            print("N/A")
        }
    }
    
    func moveForward() {
        if (orientation == "N") {
            let newPosition = [position[0], position[1] + 1]
            if (grid.ignoreCoordinates.contains(newPosition)) {
                return
            }
            if (!grid.coordinates.contains(newPosition)) {
                grid.ignoreCoordinates.append(newPosition)
                position = newPosition
                lost = true
            } else {
                position = newPosition
            }
        } else if (orientation == "E") {
            let newPosition = [position[0] + 1, position[1]]
            if (grid.ignoreCoordinates.contains(newPosition)) {
                return
            }
            if (!grid.coordinates.contains(newPosition)) {
                grid.ignoreCoordinates.append(newPosition)
                position = newPosition
            } else {
                position = newPosition
            }
        } else if (orientation == "S") {
            let newPosition = [position[0], position[1] - 1]
            if (grid.ignoreCoordinates.contains(newPosition)) {
                return
            }
            if (!grid.coordinates.contains(newPosition)) {
                grid.ignoreCoordinates.append(newPosition)
                position = newPosition
            } else {
                position = newPosition
            }
        } else {
            let newPosition = [position[0] - 1, position[1]]
            if (grid.ignoreCoordinates.contains(newPosition)) {
                return
            }
            if (!grid.coordinates.contains(newPosition)) {
                grid.ignoreCoordinates.append(newPosition)
                position = newPosition
            } else {
                position = newPosition
            }
        }
    }
    
    func turnRight() {
        if (orientation == "N") {
            orientation = "E"
        } else if (orientation == "E") {
            orientation = "S"
        } else if (orientation == "S") {
            orientation = "W"
        } else {
            orientation = "N"
        }
    }
    
    func turnLeft() {
        if (orientation == "N") {
            orientation = "W"
        } else if (orientation == "E") {
            orientation = "N"
        } else if (orientation == "S") {
            orientation = "E"
        } else {
            orientation = "S"
        }
    }
    
    func traverse(movements: String)->[Int] {
        for direction in movements {
            move(direction: direction)
        }
        return position
    }
}

class Grid {
    let coordinates: [[Int]]
    var ignoreCoordinates:[[Int]]
    init(coordinate: String) {
        ignoreCoordinates = []
        var coordinateArray:[[Int]] = []
        var upperRightCorner = coordinate.split(separator: " ")
        let xCoordinate = Int(upperRightCorner[0]) ?? 0
        let yCoordinate = Int(upperRightCorner[1]) ?? 0
        if (xCoordinate == 0 && yCoordinate == 0) {
            coordinates = []
        } else {
            for x in 0...xCoordinate {
                for y in 0...yCoordinate {
                    coordinateArray.append([x, y])
                }
            }
            coordinates = coordinateArray
        }

    }
}

class Instructions {
    var robotInstructions: [[String]]
    let upperRightCorner: String
    
    init(instructions: String) {
        print("Instructions For Robots: \n")
        print(instructions)
        let instructionsArray = instructions.split(separator: "\n")
        upperRightCorner = String(instructionsArray[0])
        robotInstructions = []
        for i in stride(from: 1, to: instructionsArray.count - 1, by: 2) {
            let instruction = [String(instructionsArray[i]), String(instructionsArray[i + 1])]
            robotInstructions.append(instruction)
        }
    }
    
    func executeInstructions() {
        var grid = Grid(coordinate: instructions.upperRightCorner)
        if (grid.coordinates.isEmpty) {
            print("Grid is empty!")
            return
        } else {
            var x = 1
            for instruction in instructions.robotInstructions {
                let position = instruction[0].split(separator: " ")
                let robotInstruction = instruction[1]
                let initialOrientation = String(position[2])
                guard let initialX = Int(position[0]) else {
                    print("Failed to get initial x position")
                    return
                }
                guard let initialY = Int(position[1]) else {
                    print("Failed to get initial x position")
                    return
                }
                var robot = Robot(orientation: String(position[2]), position: [initialX, initialY], grid: grid)
                print("Robot \(x)")
                print(robotInstruction)
                print("Initial Position: \(initialX) \(initialY) \(initialOrientation)")
                robot.traverse(movements: robotInstruction)
                print("Final Position: \n*** \(String(robot.position[0])) \(String(robot.position[1])) \(robot.orientation) \((robot.lost ? "LOST " : ""))***\n")
                x += 1
            }
        }
    }
}

let instructions = Instructions(instructions: instructionsString)
print("\n")
instructions.executeInstructions()


