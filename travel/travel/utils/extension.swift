//
//  extension.swift
//  travel
//
//  Created by Diego Alves Openheimer on 26/10/19.
//  Copyright © 2019 Diego Alves Openheimer. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        gesture.cancelsTouchesInView = false
        view.addGestureRecognizer(gesture)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}
