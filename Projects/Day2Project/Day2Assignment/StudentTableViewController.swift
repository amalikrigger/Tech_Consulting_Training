//
//  StudentTableViewController.swift
//  Day2Assignment
//
//  Created by Amali Krigger on 8/30/23.
//

import UIKit

class StudentTableViewController: UIViewController, UITableViewDataSource  {
    @IBOutlet weak var tableView: UITableView!
    let studentClass = StudentClass()
    var students:[Student] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        students = studentClass.createStudents(count: 10)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? StudentTableViewCell
        
        cell?.nameLabel.text = students[indexPath.row].name
        cell?.emailLabel.text = students[indexPath.row].email
        cell?.dobLabel.text = students[indexPath.row].dob
        cell?.imageView?.image = UIImage(named: "profile_picture_icon.png")
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }

}

class Student {
    let name:String
    let email:String
    let dob:String
    init(name: String, email: String, dob:String) {
        self.name = name
        self.email = email
        self.dob = dob
    }
}

class StudentClass {
    func createStudents(count:Int)-> [Student] {
        var students:[Student] = []
        for x in 0..<count {
            let student = Student(name: "Name \(x + 1)", email: "Email \(x + 1)", dob: "DOB \(x + 1)")
            students.append(student)
        }
        return students
    }
}
