//
//  Travel.swift
//  travel
//
//  Created by Diego Alves Openheimer on 16/10/19.
//  Copyright © 2019 Diego Alves Openheimer. All rights reserved.
//

import Foundation


class Travel : NSObject {
    
    let title: String
    let amountDays: Int
    let price: Double
    var pathImage: String
    
    init(title: String, amountDays: Int, price: Double, pathImage: String) {
        self.title = title
        self.amountDays = amountDays
        self.price = price
        self.pathImage = pathImage
    }
    
    func withImagePath(image: String) -> Travel {
        pathImage = image
        return self
    }
    
}
