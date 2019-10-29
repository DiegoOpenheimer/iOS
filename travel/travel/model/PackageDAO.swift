//
//  PackageDAO.swift
//  travel
//
//  Created by Diego Alves Openheimer on 27/10/19.
//  Copyright © 2019 Diego Alves Openheimer. All rights reserved.
//

import Foundation

class PackageDAO {
    
    func getPackages() -> Array<PackageTravel> {
        let travels = TravelDAO().getTravels()
        return [
            PackageTravel(name: "Package 1", description: "first package", date: "10/10/2020", travel: travels[0].withImagePath(image: "img6.jpg")),
            PackageTravel(name: "Package 2", description: "second package", date: "10/11/2020", travel: travels[1].withImagePath(image: "img7.jpg")),
            PackageTravel(name: "Package 3", description: "third package", date: "11/11/2021", travel: travels[2].withImagePath(image: "img8.jpg")),
            PackageTravel(name: "Package 4", description: "fourth package", date: "11/11/2021", travel: travels[3].withImagePath(image: "img9.jpg")),
            PackageTravel(name: "Package 5", description: "fifth package", date: "11/11/2021", travel: travels[4].withImagePath(image: "img10.jpg"))
        ]
    }
    
}
