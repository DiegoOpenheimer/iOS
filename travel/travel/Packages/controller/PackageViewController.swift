//
//  PackageViewController.swift
//  travel
//
//  Created by Diego Alves Openheimer on 23/10/19.
//  Copyright © 2019 Diego Alves Openheimer. All rights reserved.
//

import UIKit

class PackageViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
   
    private let packageDAO = PackageDAO()
    private var packages = Array<PackageTravel>()
    private var packagesFiltered = Array<PackageTravel>()
    
    @IBOutlet weak var labelResult: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var uiCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.hideKeyboardWhenTappedAround()
        searchBar.delegate = self
        packages = packageDAO.getPackages()
        packagesFiltered = packages
        formatterTextResult()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let predicate = NSPredicate(format: "name contains %@", searchText)
        let filtered: Array<PackageTravel> = (packages as NSArray).filtered(using: predicate) as! Array
        packagesFiltered = filtered
        let searchBarIsEmpy = searchBar.text?.isEmpty
        if packagesFiltered.isEmpty && searchBarIsEmpy != nil && searchBarIsEmpy! {
            packagesFiltered = packages
        }
        formatterTextResult()
        uiCollectionView.reloadData()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat =  20
        let collectionViewSize = collectionView.frame.size.width - padding
        let division: CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 3 : 2
        return CGSize(width: collectionViewSize / division, height: 160)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return packagesFiltered.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = DetailsPackageViewController()
        controller.packageTravel = packagesFiltered[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = uiCollectionView.dequeueReusableCell(withReuseIdentifier: "packageViewCollectionCell", for: indexPath) as! PackagesCollectionViewCell
        let package: PackageTravel = packagesFiltered[indexPath.row]
        cell.name.text = package.name
        cell.time.text = "\(package.travel.amountDays) dias"
        cell.price.text = "R$\(String(format:"%.2f", package.travel.price))"
        cell.image.image = UIImage(named: package.travel.pathImage)
        return cell
    }

    private func formatterTextResult() {
        switch packagesFiltered.count {
        case 0:
            labelResult.text = "Nenhum resultado encontrado"
        case 1:
            labelResult.text = "1 resultado encontrado"
        default:
            labelResult.text = "\(packagesFiltered.count) resultados encontrados"
        }
    }

}
