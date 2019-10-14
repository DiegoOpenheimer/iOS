//
//  Item.swift
//  study
//
//  Created by Diego Alves Openheimer on 12/10/19.
//  Copyright © 2019 Diego Alves Openheimer. All rights reserved.
//

import Foundation


class Item : NSObject, NSCoding {
   
    let name: String
    let calories: Double
    
    init(name: String, calories: Double) {
        self.name = name
        self.calories = calories
    }
    
    func toString() -> String {
        return "Item(\(name) - \(calories))"
    }
    
    static func == (firstItem: Item, secondItem: Item) -> Bool {
        return firstItem.name == secondItem.name && firstItem.calories == secondItem.calories
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(calories, forKey: "calories")
    }
    
    required init?(coder: NSCoder) {
        self.name = coder.decodeObject(forKey: "name") as! String
        self.calories = coder.decodeDouble(forKey: "calories")
    }
    
    
}
