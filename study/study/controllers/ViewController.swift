//
//  ViewController.swift
//  study
//
//  Created by Diego Alves Openheimer on 12/10/19.
//  Copyright © 2019 Diego Alves Openheimer. All rights reserved.
//

extension String {
    func trim() -> String {
        return self.trimmingCharacters(in: .whitespaces)
    }
}

import Foundation
import UIKit

class ViewController : UIViewController, UITableViewDelegate, UITableViewDataSource, AddItemDelegate {
    
    var items = Array<Item>()
    var selectedItems = Array<Item>()
    var delegate: AddMealDelegate?
    let storage = Storage()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var happinessField: UITextField?
    @IBOutlet weak var nameField: UITextField?
   
    override func viewDidLoad() {
        let itemButton = UIBarButtonItem(title: "Add Item", style: UIBarButtonItem.Style.plain, target: self, action: #selector(clickBarButtonItem))
        navigationItem.rightBarButtonItem = itemButton
        items = storage.getItems()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
      
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let item = items[row]
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: nil)
        cell.textLabel?.text = item.name
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row: Int = indexPath.row
        let item = items[row]
        let cell: UITableViewCell? =  tableView.cellForRow(at: indexPath)
        if cell?.accessoryType == UITableViewCell.AccessoryType.checkmark {
            cell?.accessoryType = UITableViewCell.AccessoryType.none
            let indexItemFound = selectedItems.firstIndex(of: item)
            if let index = indexItemFound {
                selectedItems.remove(at: index)
            }
        } else {
            cell?.accessoryType = UITableViewCell.AccessoryType.checkmark
            selectedItems.append(item)
        }
    }
    
    @IBAction func  add(_ sender: Any) {
        let nameValue = nameField?.text ?? ""
        let happinessValue = happinessField?.text ?? ""
        if nameValue.trim() == "" || happinessValue.trim() == "" {
            let alert = Alert(controller: self)
            alert.show("Attention", message: "There is field empty")
        } else {
            let meal = Meal(name: nameValue, happiness: Int(happinessValue)!, items: selectedItems)
            delegate?.add(meal)
            navigationController?.popViewController(animated: true)
        }
    }
    
    func addItem(_ item: Item) {
        items.append(item)
        tableView.reloadData()
        if !storage.saveItems(items) {
            let alert = Alert(controller: self)
            alert.show("Attention", message: "Fail to save item \(item.name)")
        }
    }
    
    @objc func clickBarButtonItem() {
        navigationController?.pushViewController(ItemViewController(delegate: self), animated: true)
    }
    
}
