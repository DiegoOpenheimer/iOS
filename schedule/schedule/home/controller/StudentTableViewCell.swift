//
//  StudentTableViewCell.swift
//  schedule
//
//  Created by Diego Alves Openheimer on 01/12/19.
//  Copyright © 2019 Diego Alves Openheimer. All rights reserved.
//

import UIKit

class StudentTableViewCell: UITableViewCell {

    @IBOutlet weak var studentImageView: UIImageView! {
        didSet {
            studentImageView.layer.cornerRadius = 25
        }
    }
    @IBOutlet weak var label: UILabel!
    
    func buildCell(student: Student) {
        label.text = student.name
        if let image = student.photo as? UIImage {
            studentImageView.image = image
        }
    }
    
}
