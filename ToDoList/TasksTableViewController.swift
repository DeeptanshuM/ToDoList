//
//  TasksTableViewController.swift
//  ToDoList
//
//  Created by Deetpanshu Malik on 3/17/17.
//  Copyright © 2017 DeeptanhuMalik. All rights reserved.
//

import UIKit

class TasksTableViewController: UITableViewController {
  
  
  
    //MARK: Properties
  
    var tasks = [Task]()
  

    override func viewDidLoad() {
        super.viewDidLoad()

      // Load the sample data.
      loadSampleToDoItems()
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

  
  
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
