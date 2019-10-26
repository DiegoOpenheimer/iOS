//
//  PackageViewController.swift
//  travel
//
//  Created by Diego Alves Openheimer on 23/10/19.
//  Copyright © 2019 Diego Alves Openheimer. All rights reserved.
//

import UIKit

class PackageViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
   
    private let travelDAO = TravelDAO()
    private var travels = Array<Travel>()
    private var travelsFiltered = Array<Travel>()
    
    @IBOutlet weak var labelResult: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var uiCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        super.hideKeyboardWhenTappedAround()
        searchBar.delegate = self
        travels = travelDAO.getTravels()
        travelsFiltered = travels
        formatterTextResult()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let predicate = NSPredicate(format: "title contains %@", searchText)
        let filtered: Array<Travel> = (travels as NSArray).filtered(using: predicate) as! Array
        travelsFiltered = filtered
        let searchBarIsEmpy = searchBar.text?.isEmpty
        if travelsFiltered.isEmpty && searchBarIsEmpy != nil && searchBarIsEmpy! {
            travelsFiltered = travels
        }
        formatterTextResult()
        uiCollectionView.reloadData()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat =  16
        let collectionViewSize = collectionView.frame.size.width - padding
        return CGSize(width: collectionViewSize / 2, height: 160)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return travelsFiltered.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = uiCollectionView.dequeueReusableCell(withReuseIdentifier: "packageViewCollectionCell", for: indexPath) as! PackagesCollectionViewCell
        let travel: Travel = travelsFiltered[indexPath.row]
        cell.name.text = travel.title
        cell.time.text = "\(travel.amountDays) dias"
        cell.price.text = "R$\(String(format:"%.2f", travel.price))"
        cell.image.image = UIImage(named: travel.pathImage)
        return cell
    }

    private func formatterTextResult() {
        switch travelsFiltered.count {
        case 0:
            labelResult.text = "Nenhum resultado encontrado"
        case 1:
            labelResult.text = "1 resultado encontrado"
        default:
            labelResult.text = "\(travelsFiltered.count) resultados encontrados"
        }
    }

}
