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
            answer: ""
        ),
        Question(
            question: "Steps to create tableView",
            answer: ""
        ),
        Question(
            question: "What is use of storyboard reference?",
            answer: ""
        ),
        Question(
            question: "What is segue?",
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


