//
//  StudentContext.swift
//  schedule
//
//  Created by Diego Alves Openheimer on 29/11/19.
//  Copyright © 2019 Diego Alves Openheimer. All rights reserved.
//

import Foundation
import CoreData

extension Student {
    
    func cloneWithContext(context: NSManagedObjectContext) -> Student {
        let student = Student(context: context)
        student.name = self.name
        student.address = self.address
        student.site = self.site
        student.photo = self.photo
        student.phone = self.phone
        student.id = self.id
        return student
    }
    
}
