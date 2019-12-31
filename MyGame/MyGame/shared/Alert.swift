//
//  Alert.swift
//  MyGame
//
//  Created by Diego Alves Openheimer on 29/12/19.
//  Copyright © 2019 Diego Alves Openheimer. All rights reserved.
//

import Foundation
import UIKit

typealias OnChoose = (UIImagePickerController.SourceType) -> Void
typealias OnConfirm = (String?) -> Void

class Alert {
    
    weak var controller: UIViewController?
    var tintColor: UIColor?
    
    init(controller: UIViewController, tintColor: UIColor? = nil) {
        self.controller = controller
        self.tintColor = tintColor
    }
    
    /**
     show a simple alert
     - parameter title: alert title
     - parameter message: alert message
     */
    func show(_ title: String = "Atenção", message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        setTintColor(alert)
        let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(ok)
        controller?.present(alert, animated: true)
    }

    /**
     show an alert with input
     - parameter title: alert title
     - parameter message: alert message
     - parameter onConfirm: callback that execute when the button ok is called
     */
    func show(_ title: String = "Atenção", message: String, onConfirm: OnConfirm? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        setTintColor(alert)
        let actionSave = UIAlertAction(title: "Ok", style: .default) { [weak alert] (_) in
            let textField = alert?.textFields?[0]
            onConfirm?(textField?.text)
        }
        let cancel = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alert.addTextField(configurationHandler: nil)
        alert.addAction(cancel)
        alert.addAction(actionSave)
        controller?.present(alert, animated: true)
    }
    
    /**
     show a action sheet to choose  a photo
     - parameter title: alert title
     - parameter message: alert message
     - parameter onChoose: callback executed when the image is choosen
     */
    func showPickerImage(_ title: String = "Atenção", message: String, onChoose: OnChoose?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        setTintColor(alert)
        let photoLibrary = UIAlertAction(title: "Fotos da biblioteca", style: .default, handler: {_ in onChoose?(.photoLibrary)})
        let camera = UIAlertAction(title: "Câmera", style: .default, handler: { _ in onChoose?(.camera) })
        let album = UIAlertAction(title: "Álbum", style: .default, handler: { _ in onChoose?(.savedPhotosAlbum) })
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            alert.addAction(camera)
        }
        alert.addAction(album)
        alert.addAction(photoLibrary)
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        controller?.present(alert, animated: true)
    }
    
    /**
     set tint color in alert controller
     - parameter alert: The componente UIAlertController
     */
    private func setTintColor(_ alert: UIAlertController) {
        if let color = tintColor {
            alert.view.tintColor = color
        }
    }
    
}
