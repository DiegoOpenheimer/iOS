//
//  DetailsPackageViewController.swift
//  travel
//
//  Created by Diego Alves Openheimer on 27/10/19.
//  Copyright © 2019 Diego Alves Openheimer. All rights reserved.
//

import UIKit
import IHKeyboardAvoiding

class DetailsPackageViewController: UIViewController {

    var packageTravel: PackageTravel?
    @IBOutlet var image: UIImageView?
    
    @IBOutlet weak var textFieldDate: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let package = packageTravel {
            image?.image = UIImage(named: package.travel.pathImage)
        }
        super.hideKeyboardWhenTappedAround()
        KeyboardAvoiding.avoidingView = self.view
        initializeTextFieldDate()
    }

    @IBAction func popPage(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    private func initializeTextFieldDate() {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        textFieldDate.inputView = datePicker
        datePicker.addTarget(self, action: #selector(eventValueChangeDatePicker(sender:)), for: .valueChanged)
    }
    
    @objc func eventValueChangeDatePicker(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MM yyyy"
        textFieldDate.text = dateFormatter.string(from: sender.date)
    }
}
