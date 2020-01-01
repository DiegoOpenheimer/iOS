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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueGameCell" {
            let vc = segue.destination as? DetailGameViewController
            let row = tableView.indexPathForSelectedRow!.row
            vc?.game = fetchController?.fetchedObjects?[row]
        }
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
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if let game = fetchController?.fetchedObjects?[indexPath.row] {
                context.delete(game)
                do {
                    try context.save()
                } catch {
                    let alert = Alert(controller: self)
                    alert.show(message: "Falha ao excluir jogo \(game.name!)")
                }
            }
        }
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let games = fetchController?.fetchedObjects
        if  games == nil || games!.isEmpty {
            let label = UILabel()
            label.text = "Nenhum game registrado"
            label.textAlignment = .center
            tableView.backgroundView = label
        } else {
            tableView.backgroundView = nil
        }
        return games?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gameCell") as! GameTableViewCell
        let game = fetchController?.fetchedObjects?[indexPath.row]
        cell.prepare(with: game!)
        return cell
    }

}


extension GameTableViewController: NSFetchedResultsControllerDelegate {
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        if type != .delete {
            tableView.reloadData()
        } else {
            tableView.deleteRows(at: [indexPath!], with: .fade)
        }
    }
    
}
