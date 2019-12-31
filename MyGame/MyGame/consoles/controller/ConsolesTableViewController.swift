//
//  ConsolesTableViewController.swift
//  MyGame
//
//  Created by Diego Alves Openheimer on 25/12/19.
//  Copyright © 2019 Diego Alves Openheimer. All rights reserved.
//

import UIKit

class ConsolesTableViewController: UITableViewController {

    let consoleManager = ConsoleManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        consoleManager.delegate = self
        consoleManager.requestConsoles()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if consoleManager.consoles.isEmpty {
            let label = UILabel()
            label.textAlignment = .center
            label.text = "Nenhuma plataforma registrada"
            tableView.backgroundView = label
            tableView.separatorStyle = .none
        } else {
            tableView.backgroundView = nil
            tableView.separatorStyle = .singleLine
        }
        return consoleManager.consoles.count
    }

    @IBAction func onTapAdd(_ sender: UIBarButtonItem) {
        let alert = Alert(controller: self, tintColor: UIColor(named: "secondary"))
        alert.show(message: "Preencha o nome da plataforma") { [ weak alert ] (value: String?) in
            guard let name = value, !name.isEmpty else { return }
            do {
                try self.consoleManager.save(with: name)
            } catch {
                alert?.show(message: "Falha ao cadastrar uma plataforma")
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = consoleManager.consoles[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            consoleManager.remove(at: indexPath.row)
        }
    }

}

extension ConsolesTableViewController : ConsoleDelegate {
    
    func onDelete(at index: Int) {
        tableView.deleteRows(at: [IndexPath(row: index, section: 0)], with: .fade)
    }
    
    func onNotifyChangeConsoles() {
        tableView.reloadData()
    }
    
    
}
