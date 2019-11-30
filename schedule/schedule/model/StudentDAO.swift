//
//  StudentDAO.swift
//  schedule
//
//  Created by Diego Alves Openheimer on 29/11/19.
//  Copyright © 2019 Diego Alves Openheimer. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class StudentModel {
    
    var id: Int64?
    var name: String?
    var address: String?
    var phone: String?
    var site: String?
    var point: Double?
    var photo: UIImage?
    
}

class StudentDAO {
    
    static let shared = StudentDAO()
    private let context: NSManagedObjectContext
    
    private init() {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        context = appDelegate!.persistentContainer.viewContext
    }
    
    func save(_ studentModel: StudentModel) throws -> Student {
        let student = Student(context: context)
        student.name = studentModel.name
        student.address = studentModel.address
        student.id = Int64(Date().timeIntervalSince1970 * 1000)
        student.phone = studentModel.phone
        student.site = studentModel.site
        student.point = studentModel.point!
        student.photo = studentModel.photo
        do {
            try context.save()
            return student
        } catch {
            throw error
        }
        
    }
    
}
