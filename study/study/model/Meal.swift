//
//  Meal.swift
//  study
//
//  Created by Diego Alves Openheimer on 12/10/19.
//  Copyright © 2019 Diego Alves Openheimer. All rights reserved.
//

import Foundation


class Meal: NSObject, NSCoding {

    
    let name: String
    let happiness: Int
    let items: Array<Item>
    
    init(name: String, happiness: Int, items: Array<Item>) {
        self.name = name
        self.happiness = happiness
        self.items = items
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(happiness, forKey: "happiness")
        coder.encode(items, forKey: "items")
    }
    
    required init?(coder: NSCoder) {
        self.name = coder.decodeObject(forKey: "name") as! String
        self.happiness = coder.decodeInteger(forKey: "happiness")
        self.items = coder.decodeObject(forKey: "items") as! Array<Item>
    }
    
    func details() -> String {
        return items.isEmpty ? "There is no item" : items.map { "\($0.name) - \($0.calories)\n" }.joined(separator: "")
    }
    
}
