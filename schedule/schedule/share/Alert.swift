//
//  Alert.swift
//  schedule
//
//  Created by Diego Alves Openheimer on 29/11/19.
//  Copyright © 2019 Diego Alves Openheimer. All rights reserved.
//

import Foundation
import UIKit

class Alert {
    
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func show(_ title: String? = "Atenção", message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "ok", style: .default)
        alert.addAction(ok)
        controller.present(alert, animated: true)
    }
    
    func showSheet(_ title: String? = "Atenção", message: String, actions: [UIAlertAction]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        let cancel = UIAlertAction(title: "Cancelar", style: .cancel)
        for action in actions {
            alert.addAction(action)
        }
        alert.addAction(cancel)
        controller.present(alert, animated: true)
    }
    
}
