import UIKit

var greeting = "Hello, playground"

protocol TableViewDataSource {
    func numerOfRows()-> Int
    func getCellForRow(index: Int)-> CellUI
}

class Controller: TableViewDataSource {
    let tableView = TableView()
    func setup() {
        tableView.delegate = self
    }
    
    func numerOfRows()-> Int {
        return 5
    }
    
    func getCellForRow(index: Int)-> CellUI {
        return  CellUI()
    }
    
    func doSomething() {
        
    }
}
class CellUI {
    
}
class TableView {
    var delegate: TableViewDataSource?
    func drawNumberOfRows() {
        
        guard let delegate = delegate else { return }
        let rows = delegate.numerOfRows()
        
        for row in 0...rows {
            let cellUI = delegate.getCellForRow(index: row)
        }
        
    }
    
}


// 1.create a class controller
// 2.create tableView Class
// 3. create obejct of table inside controller
// 4. declare object of type controller inside table named as delegate
// 5.pass object of controller inside table to that delegate refrence.
// 6.create protocol tableview datasource two methods, number of rows and cell for row at index
// 7. in table view make controller object of type datasource protocol




// 1. drag and drop controller in storyboard and create controller class and link storyboard controller scene with created class

// 2. drag and drop tableview in controller and create IBOutlet of tableView inside controller

// 3, Confirm UITableViewDataSource protcol to controller

// 4. Generate UITableViewDataSource methods stub
