//
//  TaskTableViewCell.swift
//  ToDoList
//
//  Created by Deetpanshu Malik on 3/17/17.
//  Copyright © 2017 DeeptanhuMalik. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
  //MARK: Properties
  
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var daydatetimeLabel: UILabel!
  @IBOutlet weak var priorityLabel: UILabel!

}
