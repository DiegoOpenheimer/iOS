//
//  MealTabViewController.swift
//  study
//
//  Created by Diego Alves Openheimer on 12/10/19.
//  Copyright © 2019 Diego Alves Openheimer. All rights reserved.
//

import Foundation
import UIKit

class MealTabViewController : UITableViewController, AddMealDelegate {
    
    var meals = Array<Meal>()
    let storage = Storage()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addMeal" {
            let view = segue.destination as! ViewController
            view.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        meals = storage.getMeals()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        meals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let meal = meals[row]
        let uiTableViewCell = UITableViewCell()
        uiTableViewCell.textLabel?.text = meal.name
        let gesture = UILongPressGestureRecognizer(target: self, action: #selector(longPressTableCell))
        uiTableViewCell.addGestureRecognizer(gesture)
        return uiTableViewCell
    }
    
    func add(_ meal: Meal) {
        meals.append(meal)
        tableView.reloadData()
        if !storage.saveMeals(meals) {
            let alert = Alert(controller: self)
            alert.show("Attention", message: "Fail to save meal \(meal.name)")
        }
    }
    
    
    @objc func longPressTableCell(_ gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            let cell = gesture.view as! UITableViewCell
            let indexPath: IndexPath? = tableView.indexPath(for: cell)
            let rowTableView = indexPath?.row
            if let row = rowTableView {
               let meal = meals[row]
               let alert = Alert(controller: self)
                alert.show("Status", message: meal.details(), handlerCancel: {
                   action in
                   self.meals.remove(at: row)
                   self.tableView.deleteRows(at: [(indexPath!)], with: UITableView.RowAnimation.fade)
                   if !self.storage.saveMeals(self.meals) {
                       alert.show("Attention", message: "Fail to update storage")
                   }
               }, textCancel: "Delete")
            }
        }
    }
    
    
}
