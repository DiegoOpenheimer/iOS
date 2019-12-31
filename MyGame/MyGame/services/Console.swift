//
//  Console.swift
//  MyGame
//
//  Created by Diego Alves Openheimer on 30/12/19.
//  Copyright © 2019 Diego Alves Openheimer. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class ConsoleManager {

    static let shared = ConsoleManager()
    var consoles: [Console] = []
    var delegate: ConsoleDelegate?
    var context: NSManagedObjectContext {
        return (UIApplication.shared.delegate as? AppDelegate)!.persistentContainer.viewContext
    }
    
    private init() {
        
    }
    
    /**
     request database to get consoles
     */
    func requestConsoles() {
        let fetchRequest: NSFetchRequest<Console> = Console.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true, selector: #selector(NSString.caseInsensitiveCompare(_:)))
        fetchRequest.sortDescriptors = [sortDescriptor]
        do {
            consoles = try context.fetch(fetchRequest)
            delegate?.onNotifyChangeConsoles()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    /**
     remove a console from databse
     - parameter index: index value in consoles
     */
    func remove(at index: Int) {
        if index < consoles.count {
            let console = consoles[index]
            context.delete(console)
            do {
                try context.save()
                consoles.remove(at: index)
                delegate?.onDelete(at: index)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    /**
     save a new console
     - parameter name: console name
     */
    func save(with name: String) throws {
        let console = Console(context: context)
        console.name = name
        try context.save()
        requestConsoles()
        delegate?.onNotifyChangeConsoles()
    }
    
    
}
