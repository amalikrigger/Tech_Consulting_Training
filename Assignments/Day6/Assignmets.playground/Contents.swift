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
            answer: "App Life Cycle methods are didFinishLaunchingWithOptions, sceneWillEnterForeground, sceneDidBecomeActive, sceneWillResignActive, and sceneDidEnterBackground."
        ),
        Question(
            question: "What is view controller life cycle methods?",
            answer: "The View Controller Life Cycle methods are viewDidLoad, viewWillAppear, viewDidAppear, viewWillDisappear, and viewDidDisappear."
        ),
        Question(
            question: "What are the different App States?",
            answer: "The different app states are not running, inactive, active, background, and suspended."
        ),
        Question(
            question: "Diff b/w background and suspended",
            answer: ""
        ),
        Question(
            question: "Diff b/w try, try? and try!",
            answer: ""
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
            answer: ""
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



