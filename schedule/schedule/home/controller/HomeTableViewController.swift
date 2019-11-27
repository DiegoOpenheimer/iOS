//
//  HomeTableViewController.swift
//  schedule
//
//  Created by Diego Alves Openheimer on 27/11/19.
//  Copyright © 2019 Diego Alves Openheimer. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController, UISearchBarDelegate {

    private let uiSearchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSearchController.searchBar.delegate = self
        uiSearchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = uiSearchController
    }
        
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
       print(searchText)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

}
