//
//  PurchaseCompletedViewController.swift
//  travel
//
//  Created by Diego Alves Openheimer on 10/11/19.
//  Copyright © 2019 Diego Alves Openheimer. All rights reserved.
//

import UIKit

class PurchaseCompletedViewController: UIViewController {

    var package: PackageTravel?
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var descriptionView: UILabel!
    @IBOutlet weak var titleView: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    @IBAction func goRoot(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    func initialize() {
        titleView.text = package?.name
        descriptionView.text = package?.descriptionPackage
        if let image = package?.travel.pathImage {
            imageView.image = UIImage(named: image)
        }
        imageView.layer.cornerRadius = 5
        button.layer.cornerRadius = 5
    }
}
