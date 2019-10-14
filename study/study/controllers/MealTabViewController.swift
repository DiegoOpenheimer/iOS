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
    
    
    
}
