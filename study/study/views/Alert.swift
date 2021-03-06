//
//  Alert.swift
//  study
//
//  Created by Diego Alves Openheimer on 12/10/19.
//  Copyright © 2019 Diego Alves Openheimer. All rights reserved.
//

import Foundation
import UIKit

class Alert {
    
    let controller:UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func show(_ title: String, message: String = "Unexpected error") {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let actionCancel = UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(actionCancel)
        controller.present(alert, animated: true)
    }
    
    func show(
        _ title: String,
        message: String = "Unexpected error",
        handlerCancel: @escaping (UIAlertAction) -> Void,
        textCancel: String = "Cancel"
    )
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let actionOk = UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil)
        let actionCancel = UIAlertAction(title: textCancel, style: UIAlertAction.Style.destructive, handler: handlerCancel)
        alert.addAction(actionCancel)
        alert.addAction(actionOk)
        controller.present(alert, animated: true)
  }
    
}
