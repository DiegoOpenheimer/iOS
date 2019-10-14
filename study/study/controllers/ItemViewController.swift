//
//  ItemViewController.swift
//  study
//
//  Created by Diego Alves Openheimer on 13/10/19.
//  Copyright © 2019 Diego Alves Openheimer. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController {

    var delegate: AddItemDelegate?
    
    @IBOutlet var nameField: UITextField?
    @IBOutlet var caloriesField: UITextField?
    
    init(delegate: AddItemDelegate) {
        super.init(nibName: "ItemViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "New Item"
    }
    

    @IBAction func addItem(_ sender: UIButton) {
        let name = nameField?.text ?? ""
        let calories = caloriesField?.text ?? ""
        if name.trim() == "" || calories.trim() == "" {
            let alert = Alert(controller: self)
            alert.show("Attention", message: "There is field empty")
        } else {
            let item = Item(name: name, calories: Double(calories) ?? 0.0)
            delegate?.addItem(item)
            navigationController?.popViewController(animated: true)
        }
    }
    
}
