//
//  DateExtension.swift
//  schedule
//
//  Created by Diego Alves Openheimer on 28/11/19.
//  Copyright © 2019 Diego Alves Openheimer. All rights reserved.
//

import Foundation

extension Date {
    func currentTimeMillis() -> Int64 {
        return Int64(self.timeIntervalSince1970 * 1000)
    }
}
