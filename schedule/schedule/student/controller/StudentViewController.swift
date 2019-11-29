//
//  StudentViewController.swift
//  schedule
//
//  Created by Diego Alves Openheimer on 27/11/19.
//  Copyright © 2019 Diego Alves Openheimer. All rights reserved.
//

import UIKit

class StudentViewController: UIViewController {

    @IBOutlet weak var viewImage: UIView!
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var pointField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var addressField: UITextField!
    
    @IBOutlet weak var siteField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }

    func initialize() {
        viewImage.layer.borderColor = UIColor.blue.cgColor
        viewImage.layer.borderWidth = 1
        viewImage.layer.cornerRadius = 75
    }
    
    @IBAction func saveStudent() {
        print("ok")
    }

    @IBAction func onChangeStepper(_ sender: UIStepper) {
        let value = String(sender.value)
        pointField.text = value
    }
}
