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
    private let creditCard: CreditCard = CreditCard()
    
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
        navigationController?.popViewController(animated: true)
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
        creditCard.validateDate = textFieldDate.text
    }
    
    
    @IBAction func onNumberCard(_ sender: UITextField) {
        creditCard.numberCard = Int(sender.text ?? "")
    }
    
    
    @IBAction func onNameCard(_ sender: UITextField) {
        print("ok, value is changed")
        creditCard.nameCard = sender.text
    }
    
    
    @IBAction func onCvv(_ sender: UITextField) {
        creditCard.cvv = sender.text
    }
    
    @IBAction func finalizePurchase(_ sender: UIButton) {
        if creditCard.validateAttributes() {
            let controller = PurchaseCompletedViewController()
            controller.package = packageTravel
            navigationController?.pushViewController(controller, animated: true)
        } else {
            let alert = Alert(controller: self)
            alert.show("Preencha todos os campos")
        }

    }
    
}
