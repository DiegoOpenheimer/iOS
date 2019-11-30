//
//  StudentViewController.swift
//  schedule
//
//  Created by Diego Alves Openheimer on 27/11/19.
//  Copyright © 2019 Diego Alves Openheimer. All rights reserved.
//

import UIKit
import Toast_Swift

class StudentViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    private let student: StudentModel = StudentModel()
    private let studentDAO: StudentDAO = StudentDAO.shared
    private let imagePickerController = UIImagePickerController()
    
    @IBOutlet weak var imageContent: UIImageView!
    @IBOutlet weak var viewImage: UIView!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var pointField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var addressField: UITextField!
    @IBOutlet weak var siteField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            dismiss(animated: true)
            imageContent.image = pickedImage
        }
    }

    func initialize() {
        viewImage.layer.borderColor = UIColor.blue.cgColor
        viewImage.layer.borderWidth = 1
        viewImage.layer.cornerRadius = 75
        imageContent.layer.cornerRadius = 75
        imagePickerController.delegate = self
    }
    
    @IBAction func saveStudent() {
        if validate() {
            do {
                student.photo = imageContent.image
                let studentSaved = try studentDAO.save(student)
                view.makeToast("Estudante \(studentSaved.name!) salvo com sucesso", completion: {
                    didTap in
                    self.navigationController?.popViewController(animated: true)
                })
            } catch {
                print(error)
                view.makeToast("Falha ao salvar o estudante \(student.name!)")
            }
        } else {
            let alert = Alert(controller: self)
            alert.show(message: "Preencha todos os campos corretamente")
        }
    }

    @IBAction func onChangeStepper(_ sender: UIStepper) {
        let value = String(sender.value)
        pointField.text = value
    }
    
    @IBAction func btnPhoto(_ sender: UIButton) {
        var actions: [UIAlertAction] = [UIAlertAction(title: "Galeria", style: .default, handler: {
            action in
            self.imagePickerController.sourceType = .photoLibrary
            self.present(self.imagePickerController, animated: true)
        })]
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            actions.append(UIAlertAction(title: "Câmera", style: .default, handler: {
                action in
                self.imagePickerController.sourceType = .camera
                self.present(self.imagePickerController, animated: true)
            }))
        }
        let alert = Alert(controller: self)
        alert.showSheet(message: "Escolha uma das opções", actions: actions)
    }
    
    
    private func validate() -> Bool {
        let name = nameField.text!
        let point = pointField.text!
        let phone = phoneField.text!
        let address = addressField.text!
        let site = siteField.text!
        if name == "" {
            return false
        } else {
            student.name = name
        }
        if point == "" {
             return false
         } else {
            student.point = Double(point)!
         }
        if phone == "" {
             return false
         } else {
             student.phone = phone
         }
        if address == "" {
             return false
         } else {
             student.address = address
         }
        if site == "" {
             return false
         } else {
             student.site = site
         }
        return true
    }
    
    
}
