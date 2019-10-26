//
//  PackageViewController.swift
//  travel
//
//  Created by Diego Alves Openheimer on 23/10/19.
//  Copyright © 2019 Diego Alves Openheimer. All rights reserved.
//

import UIKit

class PackageViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
   
    private let travelDAO = TravelDAO()
    
    @IBOutlet weak var uiCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        super.hideKeyboardWhenTappedAround()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat =  16
        let collectionViewSize = collectionView.frame.size.width - padding
        return CGSize(width: collectionViewSize / 2, height: 160)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return travelDAO.getTravels().count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = uiCollectionView.dequeueReusableCell(withReuseIdentifier: "packageViewCollectionCell", for: indexPath) as! PackagesCollectionViewCell
        let travels = travelDAO.getTravels()
        let travel: Travel = travels[indexPath.row]
        cell.name.text = travel.title
        cell.time.text = "\(travel.amountDays) dias"
        cell.price.text = "a partir de R$\(String(format:"%.2f", travel.price))"
        cell.image.image = UIImage(named: travel.pathImage)
        return cell
    }


}
