//
//  GameTableViewController.swift
//  MyGame
//
//  Created by Diego Alves Openheimer on 25/12/19.
//  Copyright © 2019 Diego Alves Openheimer. All rights reserved.
//

import UIKit
import CoreData

class GameTableViewController: UITableViewController {

    private var fetchController: NSFetchedResultsController<Game>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    private func initialize() {
        let fetchRequest: NSFetchRequest = Game.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true, selector: #selector(NSString.caseInsensitiveCompare(_:)))
        fetchRequest.sortDescriptors = [ sortDescriptor ]
        fetchController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        fetchController?.delegate = self
        do {
            try fetchController?.performFetch()
        } catch {
            print(error.localizedDescription)
        }
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let games = fetchController?.fetchedObjects
        if  games == nil || games!.isEmpty {
            let label = UILabel()
            label.text = "Nenhum game registrado"
            label.textAlignment = .center
            tableView.separatorStyle = .none
            tableView.backgroundView = label
        } else {
            tableView.separatorStyle = .singleLine
            tableView.backgroundView = nil
        }
        return games?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = fetchController?.fetchedObjects?[indexPath.row].name
        return cell
    }

}


extension GameTableViewController: NSFetchedResultsControllerDelegate {
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        if type != .delete {
            tableView.reloadData()
        }
    }
    
}
