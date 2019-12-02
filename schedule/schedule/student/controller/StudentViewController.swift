//
//  StudentViewController.swift
//  schedule
//
//  Created by Diego Alves Openheimer on 27/11/19.
//  Copyright © 2019 Diego Alves Openheimer. All rights reserved.
//

import UIKit
import Toast_Swift
import CoreData

class StudentViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var student: Student?
    private var context: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        return appDelegate!.persistentContainer.viewContext
    }
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
                buildStudent()
                try context.save()
                view.makeToast("Estudante \(student!.name!) salvo com sucesso", completion: {
                    didTap in
                    self.navigationController?.popViewController(animated: true)
                })
            } catch {
                print(error)
                view.makeToast("Falha ao salvar o estudante \(student!.name!)")
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
        if nameField.text! == "" {
            return false
        }
        if pointField.text! == "" {
             return false
         }
        if addressField.text! == "" {
             return false
         }
        if addressField.text! == "" {
             return false
         }
        if siteField.text! == "" {
             return false
         }
        return true
    }
    
    private func buildStudent() {
        if student == nil {
            student = Student(context: context)
        }
        student?.name = nameField.text!
        student?.point = Double(pointField.text!)!
        student?.address = addressField.text!
        student?.phone = phoneField.text!
        student?.site = siteField.text!
        student?.photo = imageContent.image
    }
    
    
}
