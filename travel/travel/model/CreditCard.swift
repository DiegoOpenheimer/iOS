//
//  CreditCard.swift
//  travel
//
//  Created by Diego Alves Openheimer on 10/11/19.
//  Copyright © 2019 Diego Alves Openheimer. All rights reserved.
//

import UIKit

class CreditCard: NSObject {

    var numberCard: Int?
    var nameCard: String?
    var validateDate: String?
    var cvv: String?
    
    override init() {
        super.init()
    }
    
    init(numberCard: Int?, nameCard: String, validateDate: String, cvv: String) {
        self.numberCard = numberCard
        self.nameCard = nameCard
        self.validateDate = validateDate
        self.cvv = cvv
    }
    
    func validateAttributes() -> Bool {
        if numberCard == nil {
            return false
        }
        if nameCard == nil || nameCard!.isEmpty {
            return false
        }
        if validateDate == nil || validateDate!.isEmpty {
            return false
        }
        if cvv == nil || cvv!.isEmpty {
            return false
        }
        return true
    }
    
}
