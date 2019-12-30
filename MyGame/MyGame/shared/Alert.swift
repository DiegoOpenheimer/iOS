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

class Alert {
    
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func show(_ title: String = "Atenção", message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(ok)
        controller.present(alert, animated: true)
    }
    
    func showPickerImage(_ title: String = "Atenção", message: String, onChoose: OnChoose?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        let photoLibrary = UIAlertAction(title: "Fotos da biblioteca", style: .default, handler: {_ in onChoose?(.photoLibrary)})
        let camera = UIAlertAction(title: "Câmera", style: .default, handler: { _ in onChoose?(.camera) })
        let album = UIAlertAction(title: "Álbum", style: .default, handler: { _ in onChoose?(.savedPhotosAlbum) })
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            alert.addAction(camera)
        }
        alert.addAction(album)
        alert.addAction(photoLibrary)
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        controller.present(alert, animated: true)
    }
    
}
