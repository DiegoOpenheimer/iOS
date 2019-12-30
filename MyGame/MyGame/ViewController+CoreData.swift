//
//  ViewController+CoreData.swift
//  MyGame
//
//  Created by Diego Alves Openheimer on 29/12/19.
//  Copyright © 2019 Diego Alves Openheimer. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension UIViewController {
    
    var context: NSManagedObjectContext {
       let delegate = UIApplication.shared.delegate as? AppDelegate
       return delegate!.persistentContainer.viewContext
   }
    
    func saveContext() throws {
        let delegate = UIApplication.shared.delegate as? AppDelegate
        try delegate?.saveContext()
    }
    
}
