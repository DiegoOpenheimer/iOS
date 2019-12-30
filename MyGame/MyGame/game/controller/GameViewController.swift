//
//  GameViewController.swift
//  MyGame
//
//  Created by Diego Alves Openheimer on 25/12/19.
//  Copyright © 2019 Diego Alves Openheimer. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    let mockData = [ "Xbox", "Playstation", "Nintendo" ]

    @IBOutlet weak var uiImage: UIImageView!
    @IBOutlet weak var calendarPicker: UIDatePicker!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var inputPlatform: UITextField!
    @IBOutlet weak var btn: UIButton!
    let consolePicker = UIPickerView()

    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    private func initialize() {
        btn.layer.cornerRadius = 5
        inputPlatform.inputView = consolePicker
        consolePicker.selectedRow(inComponent: 0)
        inputPlatform.text = mockData[0]
        consolePicker.delegate = self
    }
    
    @IBAction func onTappedBtnAddAndEdit(_ sender: UIButton) {
        if validateForm() {
            let game = Game(context: context)
            game.name = nameField.text
            game.releaseDate = calendarPicker.date
            game.cover = uiImage.image
            do {
                try saveContext()
                navigationController?.popViewController(animated: true)
            } catch {
                let alert = Alert(controller: self)
                alert.show(message: "Houve uma falha")
            }
        }
    }
    
    func validateForm() -> Bool {
        let name = nameField.text
        if name == nil || name!.isEmpty {
            let alert = Alert(controller: self)
            alert.show(message: "Preencha o nome do jogo")
            return false
        }
        return true
    }
    
    @IBAction func choosePhoto(_ sender: UIButton) {
        let imageController = UIImagePickerController()
        imageController.delegate = self
        let alert = Alert(controller: self)
        alert.showPickerImage(message: "Escolher uma foto") { source in
            imageController.sourceType = source
            self.present(imageController, animated: true)
        }
    }
    
}


extension GameViewController : UIPickerViewDelegate, UIPickerViewDataSource {
  
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return mockData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return mockData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        inputPlatform.text = mockData[row]
    }
    
}


extension GameViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            dismiss(animated: true)
            uiImage.image = image
        }
    }
    
}

