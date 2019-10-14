//
//  Storage.swift
//  study
//
//  Created by Diego Alves Openheimer on 13/10/19.
//  Copyright © 2019 Diego Alves Openheimer. All rights reserved.
//

import Foundation


class Storage {
    
    private let pathMeal = FileManager()
        .urls(for: .documentDirectory, in: .userDomainMask)
        .first!
        .appendingPathComponent("meals")
    
    private let pathItem = FileManager()
        .urls(for: .documentDirectory, in: .userDomainMask)
        .first!
        .appendingPathComponent("items")
    
    func saveMeals(_ meals: Array<Meal>) -> Bool {
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: meals, requiringSecureCoding: false)
            try data.write(to: pathMeal)
            return true
        } catch {
            return false
        }
    }
    
    func saveItems(_ items: Array<Item>) -> Bool {
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: items, requiringSecureCoding: false)
            try data.write(to: pathItem)
            return true
        } catch {
            return false
        }
    }
    
    func getMeals() -> [Meal] {
        if let nsData = NSData(contentsOf: pathMeal) {
            do {
                let data = Data(referencing: nsData)
                return try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as! Array<Meal>
            } catch {
                return []
            }
        } else {
            return []
        }
    }
    
    func getItems() -> [Item] {
        if let nsData = NSData(contentsOf: pathItem) {
            do {
                let data = Data(referencing: nsData)
                return try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as! [Item]
            } catch {
                return []
            }
        } else {
            return []
        }
    }
    
}

