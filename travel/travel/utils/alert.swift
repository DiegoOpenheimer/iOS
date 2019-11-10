//
//  alert.swift
//  travel
//
//  Created by Diego Alves Openheimer on 10/11/19.
//  Copyright © 2019 Diego Alves Openheimer. All rights reserved.
//

import Foundation
import UIKit

class Alert {
    
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func show(_ message: String, title: String = "Atenção") {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(ok)
        controller.present(alert, animated: true)
    }
    
}
