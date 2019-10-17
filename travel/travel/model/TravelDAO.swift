//
//  TravelDAO.swift
//  travel
//
//  Created by Diego Alves Openheimer on 16/10/19.
//  Copyright © 2019 Diego Alves Openheimer. All rights reserved.
//

import Foundation


class TravelDAO {
    
    func getTravels() -> [Travel] {
        return [
            Travel(title: "First", amountDays: 10, price: 100, pathImage: "img1.png"),
            Travel(title: "Second", amountDays: 5, price: 1000.40, pathImage: "img2.jpg"),
            Travel(title: "Third", amountDays: 15, price:31000.20, pathImage: "img3.jpg"),
            Travel(title: "Fourth", amountDays: 25, price:5000.40, pathImage: "img4.jpg"),
            Travel(title: "Fifth", amountDays: 35, price: 3000.60, pathImage: "img5.jpg")
        ]
    }
    
}
