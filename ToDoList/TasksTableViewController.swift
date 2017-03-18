//
//  TasksTableViewController.swift
//  ToDoList
//
//  Created by Deetpanshu Malik on 3/17/17.
//  Copyright © 2017 DeeptanhuMalik. All rights reserved.
//
import UIKit
import os.log
import RealmSwift

class TasksTableViewController: UITableViewController {
  
  @IBOutlet var reload: UITableView!
  
  //MARK: Properties
  
  var tasks = [Task]()
  
  let realm = try! Realm()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationItem.leftBarButtonItem = editButtonItem
    
    // Load the sample data.
    //loadSampleToDoItems()
    tasks += try! Realm().objects(Task.self).sorted(byKeyPath: "date")
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tasks.count
  }
  
  
  let cellIdentifier = "TaskTableViewCell"
  let dateFormatter = DateFormatter()
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
      as? TaskTableViewCell  else {
        fatalError("The dequeued cell is not an instance of TableTableViewCell.")
    }
    let task = tasks[indexPath.row]
    cell.nameLabel.text = task.name
    dateFormatter.dateFormat = "EEEE, MM-dd-yyyy HH:mm a"
    cell.daydatetimeLabel.text = dateFormatter.string(from: task.date as Date)
    if(task.priority == 1){
      cell.priorityLabel.text = ""
    }
    if(task.priority == 2){
      cell.priorityLabel.text = "!"
    }
    if(task.priority == 3){
      cell.priorityLabel.text = "!!"
    }
    if(task.priority == 4){
      cell.priorityLabel.text = "!!!"
    }
    return cell
  }
  
  
  
  // Override to support conditional editing of the table view.
  override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    // Return false if you do not want the specified item to be editable.
    return true
  }
  
  
  
  // Override to support editing the table view.
  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      // Delete the row from the data source
      realm.beginWrite()
      realm.delete(tasks[indexPath.row])
      try! realm.commitWrite()
      tasks.remove(at: indexPath.row)
      tableView.deleteRows(at: [indexPath], with: .fade)
    } else if editingStyle == .insert {
      // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
  }
  
  
  /*
   // Override to support rearranging the table view.
   override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
   
   }
   */
  
  /*
   // Override to support conditional rearranging of the table view.
   override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
   // Return false if you do not want the item to be re-orderable.
   return true
   }
   */
  
  
  // MARK: - Navigation
  
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    super.prepare(for: segue, sender: sender)
    
    switch(segue.identifier ?? "") {
      
    case "AddItem":
      os_log("Adding a new task.", log: OSLog.default, type: .debug)
      
      
    case "ShowDetail":
      guard let mealDetailViewController = segue.destination as? TaskViewController else {
        fatalError("Unexpected destination: \(segue.destination)")
      }
      
      guard let selectedTaskCell = sender as? TaskTableViewCell else {
        fatalError("Unexpected sender: \(sender)")
      }
      
      guard let indexPath = tableView.indexPath(for: selectedTaskCell) else {
        fatalError("The selected cell is not being displayed by the table")
      }
      
      let selectedTask = tasks[indexPath.row]
      mealDetailViewController.task = selectedTask
      
    default:
      fatalError("Unexpected Segue Identifier; \(segue.identifier)")
    }
  }
  
  //MARK: Actions
  
  @IBAction func unwindToTaskList(sender: UIStoryboardSegue) {
    if let sourceViewController = sender.source as? TaskViewController{
      let task = sourceViewController.task
      
      if let selectedIndexPath = tableView.indexPathForSelectedRow {
        //delete modified task.
        realm.beginWrite()
        realm.delete(tasks[selectedIndexPath.row])
        try! realm.commitWrite()
        tableView.deleteRows(at: [selectedIndexPath], with: .fade)
      }
      
      // Add a new to-do task.
      try! realm.write {
        realm.add(task!)
        }
      
    }
    tasks.removeAll()
    tasks += try! Realm().objects(Task.self).sorted(byKeyPath: "date")
    self.reload.reloadData()
  }




//MARK: Private Methods

private func loadSampleToDoItems() {
  let Task1 = Task()
  Task1.name = "A"
  Task1.date = NSDate()
  Task1.priority = 1
  Task1.notes = "dsjkndf"
  
  let Task2 = Task()
  Task2.name = "B"
  Task2.date = NSDate()
  Task2.priority = 2
  Task2.notes = "dsjkndf"
  
  let Task3 = Task()
  Task3.name = "C"
  Task3.date = NSDate()
  Task3.priority = 3
  Task3.notes = "dsjkndf"
  
  let Task4 = Task()
  Task4.name = "D"
  Task4.date = NSDate()
  Task4.priority = 4
  Task4.notes = "dsjkndf"
  
  tasks += [Task1, Task2, Task3, Task4]
  
}

}
