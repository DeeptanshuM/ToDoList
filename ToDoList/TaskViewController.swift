//
//  TaskViewController.swift
//  ToDoList
//
//  Created by Deetpanshu Malik on 3/17/17.
//  Copyright © 2017 DeeptanhuMalik. All rights reserved.
//

import UIKit
import os.log

class TaskViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    tasknameTextField.delegate = self
    notesTextView.delegate = self
    
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
    //
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
  
  //MARK: Navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    super.prepare(for: segue, sender: sender)
    
    guard let button = sender as? UIBarButtonItem, button === saveButton else {
      os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
      return
    }
    
    //let taskName = tasknameTextField.text ?? ""
    
  }
  
  //MARK: Actions

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

