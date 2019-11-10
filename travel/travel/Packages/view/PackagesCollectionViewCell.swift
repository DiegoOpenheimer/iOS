//
//  PackagesCollectionViewCell.swift
//  travel
//
//  Created by Diego Alves Openheimer on 25/10/19.
//  Copyright © 2019 Diego Alves Openheimer. All rights reserved.
//

import UIKit

class PackagesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var container: UIView! {
        didSet {
            container.layer.cornerRadius = 10
            container.layer.borderWidth = 1
            container.layer.borderColor = UIColor(red: 85.0/255.0, green: 85.0/255.0, blue: 85.0/255.0, alpha: 1.0).cgColor
        }
    }
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var price: UILabel!
    
}
