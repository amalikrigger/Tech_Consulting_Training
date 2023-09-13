import UIKit



//

// 1 1  2  3  5  8  13  21  34 .....


// input : a gvien number from fibonicee series like 5
// size of fibnocie , starting gvien fib number = 4

// [5 , 8 , 13, 21]


//  input  8 ,  3
//  output = [8 , 13,  21 ]


// do this using higher order function





/*
 
 1. What is GCD?
 - GCD stands for Grand Central Dispatch. It is a powerful concurrency framework. GCD simplifies the process of writing
 concurrent code by abstracting away many of the low level details of thread management. It is a fundamental way for
 writing concurrent and parallel code in Swift applications. It helps to ensure good performance and responsiveness in
 you apps while simplifying the management of threads and queues.
 
 2. What is QOS
 - QOS in Swift stands for Quality of Service. It is used to define the priority of work items and tasks in the GCD. It helps
 you to specify the importance and urgency of a task, helping the system make decisions about how to schedule and prioritize
 tasks on available threads or queues. This helps to ensure that more critical tasks get executed properly.
 
 3. What is diff b/w main q and global q
 - They are both types provided by the GCD. The main queue is the most critical within the GCD and is referred to as the main
 thread. Primarily used for UI related tasks and updates. These tasks are executed in the main thread. Glocal queues, also known
 as concurrent queues are created by GCD to execute concurrent tasks. They are typically used for background tasks, data processing,
 and other tasks that can be performed concurrently without impacting the UI's responsiveness. Used using DispatchQueue.global(qos:)
 
 4. Default queues provided by GCD?
 - The default queues are .userInteractive, .userInitiated, .default, .utility, and .background.
 
 5. Will you use global q or custom concurrent queue , which one and why
 - Use global queues when you want to do background tasks, non UI tasks, when you don't need explicit control over thread management,
 and leverage system resources efficiently. Use custom concurrent queues when you need explicit control, data synchronization, tasks
 with dependencies, encapsulating specific subsystems, and when you want to prioritize your own tasks.

 6. What is higher order functions , examples
 - A higher order function is a function that can take one or more functions as an argument or returns a function as a result. Some examples
 are map, compactmap, reduce, filter, sort, sorted, foreach and more.

 7. Diff b/w map and compactmap
 - A map can return and optionals and compactmap filters out the nil values and unwrap the optionals automatically.
 
 8. What reduce does?
 - It combines all the elements in the array into a single value. It iterates through the collection, applies a specified closure to each
 statement, and accumulates the results into a single value.
 
 9 . diff b/w sort and sorted
 - sort sorts the initial collection and sorted returns a new sorted collection.
*/



// Assignment during class

// add delete button in country cell and on click of that delete country from array and refresh tableView

 // Note : don't use swipe delete action.
