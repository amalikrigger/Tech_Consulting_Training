import UIKit

// Theory

// 1. What is protocol delegate pattern, write some sample code to explain

// 2. Steps to create tableView

// 3. What is use of storyboard reference

// 4. What is segue?

// Practical

// 1. Create a tableview and display list of 10 students using array

    // Student should have name, email, dob, aavtar
    // use avatar image from assets

// 2. Write logic for calculator UI.

// 3. From Loginview controller navigate to Student list.

// **********************************************************

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
            question: "What is protocol delegate pattern, write some sample code to explain",
            answer: "The protocol delegate pattern is used to allow two objects to communicate and collaborate with each other. You first define a protocol to serve as a blueprint for all the methods and properties the delegate will have. Then you create the class that will have the delegate property to hold the delegate object. Then you create a class that conforms to the delegate protocol and implements its required methods and properties."
        ),
        Question(
            question: "Steps to create TableView",
            answer: "To create a TableView you first have to create a new story board. Create a UIViewController for the story board and set the story board to the controller. Then you drag a TableView into the story board and create an IBOutlet reference to it in the controller. Set your UIViewController to implement the TableViewDataSource protocol. Then implement the sub methods from the TableViewDataSource protocol. Drag a TableViewCell into the TableView and set the ReusableID. Set the withIdentifier parameter in the dequeueReusableCell method inside the tableView Function."
        ),
        Question(
            question: "What is use of storyboard reference?",
            answer: "This is used to separate different sections of your app into different storyboard styles. This helps you to organize your UI designs."
        ),
        Question(
            question: "What is segue?",
            answer: "A segue is used to transition from one screen to another."
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

protocol StudentsDataSource {
    func numberOfStudents()->Int
    func averageGPA()->Double
}

class School {
    var delegate: StudentsDataSource?
    
    func printNumberOfStudents() {
        guard let delegate = delegate else {
            return
        }
        var numStudents = delegate.numberOfStudents()
        print("There are \(numStudents) students")
    }
    
    func printAverageGPA() {
        guard let delegate = delegate else {
            return
        }
        var aveGPA = delegate.averageGPA()
        print("There average GPA is \(aveGPA)")
    }
    
    func startSchool() {
        print("School started")
    }
}

class Students: StudentsDataSource {
    let school:School = School()
    
    init() {
        school.delegate = self
    }
    
    func numberOfStudents()->Int {
        return 10
    }
    
    func averageGPA()->Double {
        return 3.6
    }
}

let students = Students()
students.school.printNumberOfStudents()
students.school.printAverageGPA()
let school = School()
school.delegate = students
school.printAverageGPA()
school.startSchool()


