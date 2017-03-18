//
//  TaskViewController.swift
//  ToDoList
//
//  Created by Deetpanshu Malik on 3/17/17.
//  Copyright © 2017 DeeptanhuMalik. All rights reserved.
//
import UIKit
import os.log
import RealmSwift

class TaskViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tasknameTextField.delegate = self
    notesTextView.delegate = self
    
    // Set up views if editing an existing Task.
    if let task = task {
      navigationItem.title = task.name
      tasknameTextField.text = task.name
      tododateDatePicker.date = task.date as Date
      notesTextView.text = task.notes
    }
    
    // Enable the Save button only if the user has entered a task name.
    updateSaveButtonState()
    
    nopriorityButton.layer.cornerRadius = 5
    nopriorityButton.layer.borderColor = nopriorityButton.currentTitleColor.cgColor
    highpriorityButton.layer.cornerRadius = 5
    highpriorityButton.layer.borderColor = highpriorityButton.currentTitleColor.cgColor
    veryhighpriorityButton.layer.cornerRadius = 5
    veryhighpriorityButton.layer.borderColor = veryhighpriorityButton.currentTitleColor.cgColor
    highestpriorityButton.layer.cornerRadius = 5
    highestpriorityButton.layer.borderColor = highestpriorityButton.currentTitleColor.cgColor
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  //MARK: UITextFieldDelegate
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    //Hide the keyboard
    textField.resignFirstResponder()
    return true
  }
  
  func textFieldDidEndEditing(_ textField: UITextField) {
    updateSaveButtonState()
    navigationItem.title = tasknameTextField.text
  }
  
  func textFieldDidBeginEditing(_ textField: UITextField) {
    // Disable the Save button while editing.
    saveButton.isEnabled = false
  }
  
  //MARK: UITextViewDelegate
  func textViewShouldReturn(_ textView: UITextView, replacementText text: String) -> Bool {
    //Hide the keyboard
    textView.resignFirstResponder()
    return true
  }
  
  func textViewDidEndEditing(_ textView: UITextView) {
    //
  }
  
  
  //MARK: Properties
  @IBOutlet weak var tasknameTextField: UITextField!
  @IBOutlet weak var notesTextView: UITextView!
  @IBOutlet weak var tododateDatePicker: UIDatePicker!
  @IBOutlet weak var displayToDoTimeLabel: UILabel!
  @IBOutlet weak var saveButton: UIBarButtonItem!
  
  @IBOutlet weak var nopriorityButton: UIButton!
  @IBOutlet weak var highpriorityButton: UIButton!
  @IBOutlet weak var veryhighpriorityButton: UIButton!
  @IBOutlet weak var highestpriorityButton: UIButton!
  
  var task: Task?
  var priority = 1
  
  // Get the default Realm
//  let realm = try! Realm()
  
  //MARK: Navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    super.prepare(for: segue, sender: sender)
    
    guard let button = sender as? UIBarButtonItem, button === saveButton else {
      os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
      return
    }
    if(task == nil){
      task = Task()
    }
    
    task!.name = tasknameTextField.text ?? ""
    task!.date = tododateDatePicker.date as NSDate
    task!.priority = priority
    task!.notes = notesTextView.text ?? ""
    
//    try! realm.write {
//      realm.add(task!)
//    }
    
  }
  
  @IBAction func cancel(_ sender: UIBarButtonItem) {
    let isPresentingInAddMealMode = presentingViewController is UINavigationController
    
    if isPresentingInAddMealMode {
      dismiss(animated: true, completion: nil)
    }
      
    else if let owningNavigationController = navigationController{
      owningNavigationController.popViewController(animated: true)
    }
      
    else {
      fatalError("The MealViewController is not inside a navigation controller.")
    }
    
  }
  
  //MARK: Action
  @IBAction func priorityNoneSelected(_ sender: UIButton) {
    updatePriority(val: 1)
  }
  
  @IBAction func priorityOneSelected(_ sender: UIButton) {
    updatePriority(val: 2)
  }
  
  @IBAction func priorityTwoSelected(_ sender: UIButton) {
    updatePriority(val: 3)
  }
  
  @IBAction func priorityThreeSelected(_ sender: UIButton) {
    updatePriority(val: 4)
  }
  
  // MARK: Private Methods
  
  private func updateSaveButtonState() {
    // Disable the Save button if the text field is empty.
    let text = tasknameTextField.text ?? ""
    saveButton.isEnabled = !text.isEmpty
  }
  
  private func updatePriority(val: Int) -> Void{
    self.priority = val
    if(val == 1){
      nopriorityButton.layer.borderWidth = 1
      highpriorityButton.layer.borderWidth = 0
      veryhighpriorityButton.layer.borderWidth = 0
      highestpriorityButton.layer.borderWidth = 0
    }
    
    if(val == 2){
      nopriorityButton.layer.borderWidth = 0
      highpriorityButton.layer.borderWidth = 1
      veryhighpriorityButton.layer.borderWidth = 0
      highestpriorityButton.layer.borderWidth = 0
    }
    
    if(val == 3){
      nopriorityButton.layer.borderWidth = 0
      highpriorityButton.layer.borderWidth = 0
      veryhighpriorityButton.layer.borderWidth = 1
      highestpriorityButton.layer.borderWidth = 0
    }
    
    if(val == 4){
      nopriorityButton.layer.borderWidth = 0
      highpriorityButton.layer.borderWidth = 0
      veryhighpriorityButton.layer.borderWidth = 0
      highestpriorityButton.layer.borderWidth = 1
    }
  }
}
