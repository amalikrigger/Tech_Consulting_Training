import UIKit


// Due date : 08/31

// Store below Products URL Json locally in local json file , read local json file data , parse it and disply in TableView.


//   https://dummyjson.com/products



// what is app life cycle methods
// what is view controller life cycle methods
// different App States
// Diff b/w background and Suspended
// Diff b/w try, try? and try!
// different type of inheritance
// why multiple inheritance is not supported
// diff b/w Struct and classes

protocol QuestionProtocol {
    func printQuestion(index: Int)
    func answerQuestion()
}

class Question: QuestionProtocol {
    var question: String = ""
    var answer: String = ""
    
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
            question: "What is app life cycle methods?",
            answer: "App Life Cycle methods are predefined methods in the AppDelegate class that allow you to respond to various events and states that occur during the lifetime of the application.\n\ndidFinishLaunchingWithOptions: This is called when the app is launched and finished initialization. It gives you a chance to provide initial launch options to setup your app.\n\nsceneWillEnterForeground: This is called right before the app is about to transition from the background to the foreground.\n\nsceneDidBecomeActive: This is called when the app becomes active after being in the background.\n\nsceneWillResignActive: This is called when the app is about to become inactive. This is a good place to stop ongoing tasks\n\nsceneDidEnterBackground: This is triggered when the app is about to enter the background state."
        ),
        Question(
            question: "What is view controller life cycle methods?",
            answer: "The View Controller Life Cycle methods are predefined methods that are included in the UIViewController class and they allow you to respond to various events and states that occur throughout the controller's lifetime.\n\nviewDidLoad: This is called when the view is loaded into memory.\n\nviewWillAppear: Called just before the view is about to appear on the screen\n\nviewDidAppear: Called after the view has appeared on the screen\n\nviewWillDisappear: Triggered when the view is about to be removed from the screen\n\nviewDidDisappear: Called after the view has been removed from the screen."
        ),
        Question(
            question: "What are the different App States?",
            answer: "The different app states are not running, inactive, active, background, and suspended."
        ),
        Question(
            question: "Diff b/w Background and Suspended",
            answer: "The Background state is when the app is running code and performing tasks while it is not visible on the screen. The Suspended state is when the app is on the background but not actively running code or tasks."
        ),
        Question(
            question: "Diff b/w try, try? and try!",
            answer: "They are used in error handling to handle errors differently. The try method is used when you call a method that can potentially throw an error. The try? keyword is used when you want to call a function or method that can throw an error, but you're willing to accept the error and convert it to an optional value. The try! keyword is used when you're absolutely certain that a function or method call will not throw an error at runtime. It's a way of forcefully unwrapping the result of the function as if it can never be nil or result in an error."
        ),
        Question(
            question: "Different type of inheritance",
            answer: "There is Single Inheritance, Multiple Inheritance, and Multilevel Inheritance."
        ),
        Question(
            question: "Why multiple inheritance is not supported",
            answer: "This is to avoid ambiguity in a class. An example is a class that inherits from two different classes that have the same method."
        ),
        Question(
            question: "Diff b/w Struct and Classes",
            answer: "Structs are value types and Classes are reference types. By efaualt Structs are immutable and classes are mutable. Classes support inheritance and Structs don't. Memory for Structs are managed in the stack and memory in the Classes are managed on the heap. Structs automatically initialize and Classes don't. When passing a Struct to a new variable or pass it as a parameter, a new copy of the instance is created. For a Class you pass a reference to the same instance. Structs are generally more memory efficient because of their copy on assignment behavior and stack memory based allocation. Classes have a slightly higher memory overhead due to refernece tracking and heap based memory allocation."
        )
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



