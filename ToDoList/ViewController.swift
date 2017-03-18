//
//  ViewController.swift
//  ToDoList
//
//  Created by Deetpanshu Malik on 3/17/17.
//  Copyright © 2017 DeeptanhuMalik. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    tasknameTextField.delegate = self
    notesTextView.delegate = self
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
  
  
  //MARK: Actions

  @IBAction func priorityNoneSelected(_ sender: UIButton) {
  }
  
  @IBAction func priorityOneSelected(_ sender: UIButton) {
  }
  
  @IBAction func priorityTwoSelected(_ sender: UIButton) {
  }
  
  @IBAction func priorityThreeSelected(_ sender: UIButton) {
  }
}

