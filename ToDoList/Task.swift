//
//  Task.swift
//  ToDoList
//
//  Created by Deetpanshu Malik on 3/17/17.
//  Copyright © 2017 DeeptanhuMalik. All rights reserved.
//

import Foundation
import RealmSwift

class Task: Object {
  dynamic var name = ""
  dynamic var date = NSDate()
  dynamic var priority = 0
  dynamic var notes = ""
}
