//
//  HomeTableViewController.swift
//  schedule
//
//  Created by Diego Alves Openheimer on 27/11/19.
//  Copyright © 2019 Diego Alves Openheimer. All rights reserved.
//

import UIKit
import CoreData
import Toast_Swift

class HomeTableViewController: UITableViewController, UISearchBarDelegate, NSFetchedResultsControllerDelegate, StudentDelegate {

    private var students = Array<Student>()
    private var studentSelected: Student?
    private let uiSearchController = UISearchController(searchResultsController: nil)
    private var context: NSManagedObjectContext {
        let delegate = UIApplication.shared.delegate as? AppDelegate
        return delegate!.persistentContainer.viewContext
    }
    private var fetchController: NSFetchedResultsController<Student>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSearchController.searchBar.delegate = self
        uiSearchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = uiSearchController
        getStudents()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination as! StudentViewController
        if segue.identifier == "addStudent" {
            viewController.studentDelegate = self
        } else if segue.identifier == "editStudent" {
            viewController.student = studentSelected
        }
    }
        
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
       print(searchText)
    }
    
    func onRegistered(_ student: Student) {
        view.makeToast("Estudante \(student.name!) salvo com sucesso")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        studentSelected = students[indexPath.row]
        return indexPath
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentTableViewCell") as! StudentTableViewCell
        let student = students[indexPath.row]
        cell.buildCell(student: student)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let student = students[indexPath.row]
            context.delete(student)
            do {
                try context.save()
                if let index = students.firstIndex(of: student) {
                    students.remove(at: index)
                    tableView.deleteRows(at: [indexPath], with: .fade)
                }
            } catch {
                view.makeToast("Falha ao remover o estudante \(student.name!)")
            }
        }
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        if type != .delete {
            students = fetchController?.fetchedObjects ?? []
            tableView.reloadData()
        }
    }
    
    private func getStudents() {
        let fetchRequest: NSFetchRequest = Student.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true, selector: #selector(NSString.caseInsensitiveCompare(_:)))
        fetchRequest.sortDescriptors = [sortDescriptor]
        fetchController = NSFetchedResultsController<Student>(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        fetchController?.delegate = self
        do {
            try fetchController?.performFetch()
            students = fetchController?.fetchedObjects ?? []
        } catch {
            print(error.localizedDescription)
        }
    }

}
