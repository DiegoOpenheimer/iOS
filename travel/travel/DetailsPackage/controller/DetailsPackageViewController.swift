//
//  DetailsPackageViewController.swift
//  travel
//
//  Created by Diego Alves Openheimer on 27/10/19.
//  Copyright © 2019 Diego Alves Openheimer. All rights reserved.
//

import UIKit

class DetailsPackageViewController: UIViewController {

    var packageTravel: PackageTravel?
    @IBOutlet var image: UIImageView?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let package = packageTravel {
            image?.image = UIImage(named: package.travel.pathImage)
        }
        super.hideKeyboardWhenTappedAround()
    }

    @IBAction func popPage(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
