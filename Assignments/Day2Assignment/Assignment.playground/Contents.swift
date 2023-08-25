import UIKit

// RUN THE CODE TO SEE MY ANSWERS :)

// Due Date : 25/08

// Interview Questions (Theory)

// 1. What is initilizers, use with example
// 2. What is protocol extension
// 3. What is class extension
// 4. What is type alias
// 5. What is storybaords behind the scene
// 6. What is closure

protocol QuestionProtocol {
    func printQuestion(index: Int)
    func answerQuestion()
}

class Question: QuestionProtocol {
    let question: String
    let answer: String
    
    init(question: String, answer: String) {
            self.question = question
            self.answer = answer
    }
    
    func printQuestion(index: Int) {
        print(index.formatted() + ". " + question)
    }
    
    func answerQuestion() {
        print("   - " + answer)
    }
}

class Questions {
    var questionsList: [Question] = [
        Question(
            question: "What is initilizers, use with example?",
            answer: "Initializers are similar to constructors. They provide a way for you to instantiate a class with values. In Swift it is a special type of function that uses the word \"init\"."
        ),
        Question(
            question: "What is class extension?",
            answer: "Extensions are used to add functionality to an existing class (or other suitable types)."
        ),
        Question(
            question: "What is type alias?",
            answer: "A Type Alias allows you to give a new name (keyword) to an existing type or types."
        ),
        Question(
            question: "What is storyboards behind the scene?",
            answer: "A storyboard behind the scenes is XML."
        ),
        Question(
            question: "What is a closure?",
            answer: "Closures are similar to lambdas in other languages. Closures are like little bundles or mini packages of code that you can use whenever you need to do a specific job in your computer program."
        ),
    ]
    
    func printQuestionsandAnswers() {
        var i = 0
        for question in questionsList {
            i += 1
            question.printQuestion(index: i)
            question.answerQuestion()
            print("\n")
        }
    }
}


var questions:Questions = Questions()

questions.printQuestionsandAnswers()


// Coding Questions

//1 create project which have  login Screen with userName , password fields and login button , it should work on iPhone and ipad and different Orientations

//2. Create project which have  Calculator Kind of UI with numbers and different operations

// 3. Create a closure to take firstName , lastName as param and return fullName

let employee:(String, String) -> String = {
    return $0 + " " + $1
}

var fullName = employee("Amali", "Krigger")
print("Full name: " + fullName)
