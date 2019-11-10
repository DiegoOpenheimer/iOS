//
//  PackageTravel.swift
//  travel
//
//  Created by Diego Alves Openheimer on 27/10/19.
//  Copyright © 2019 Diego Alves Openheimer. All rights reserved.
//

import UIKit

class PackageTravel: NSObject {

    @objc let name: String
    let descriptionPackage: String
    let date: String
    let travel: Travel
    
    init(name: String, description: String, date: String, travel: Travel) {
        self.name = name
        self.descriptionPackage = description
        self.date = date
        self.travel = travel
    }
    
}
