//
//  StudentDelegate.swift
//  schedule
//
//  Created by Diego Alves Openheimer on 07/12/19.
//  Copyright © 2019 Diego Alves Openheimer. All rights reserved.
//

import Foundation

@objc
protocol StudentDelegate {
    
    @objc optional func onRegistered(_ student: Student)
    
    @objc optional func onUpdated(_ student: Student)
    
    @objc optional func onDeleted(_ student: Student)
    
}
