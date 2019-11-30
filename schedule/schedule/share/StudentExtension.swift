//
//  StudentExtension.swift
//  schedule
//
//  Created by Diego Alves Openheimer on 29/11/19.
//  Copyright © 2019 Diego Alves Openheimer. All rights reserved.
//

import Foundation

extension Student {
    
    func validate() -> Bool {
        if self.name == nil || self.name == "" {
            return false
        }
        if self.address == nil || self.address == "" {
            return false
        }
        if self.point == nil {
            return false
        }
        if self.phone == nil || self.phone == "" {
            return false
        }
        return true
    }
    
}
