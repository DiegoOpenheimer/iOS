//
//  GameViewController.swift
//  MyGame
//
//  Created by Diego Alves Openheimer on 25/12/19.
//  Copyright © 2019 Diego Alves Openheimer. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    let consoleManager = ConsoleManager.shared
    var consoleSelected: Console?
    var game: Game?
    
    @IBOutlet weak var uiImage: UIImageView!
    @IBOutlet weak var calendarPicker: UIDatePicker!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var inputPlatform: UITextField!
    @IBOutlet weak var btn: UIButton!
    let consolePicker = UIPickerView()

    override func viewDidLoad() {
        super.viewDidLoad()
        consolePicker.delegate = self
        consoleManager.requestConsoles()
        initialize()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        context.rollback()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    private func initialize() {
        btn.layer.cornerRadius = 5
        if !consoleManager.consoles.isEmpty {
            inputPlatform.isEnabled = true
            inputPlatform.inputView = consolePicker
        } else {
            inputPlatform.isEnabled = false
        }
        if let gm = game {
            nameField.text = gm.name
            uiImage.image = gm.cover as? UIImage
            calendarPicker.date = gm.releaseDate!
            if let console = gm.console {
                let index = consoleManager.consoles.firstIndex(of: console)!
                initConsolePicker(at: index, showInInput: true)
            } else {
                initConsolePicker(at: 0)
            }
        } else {
            initConsolePicker(at: 0)
        }
    }
    
    private func initConsolePicker(at index: Int, showInInput: Bool = false) {
        consoleSelected = consoleManager.consoles[index]
        consolePicker.selectRow(index, inComponent: 0, animated: true)
        if showInInput {
            inputPlatform.text = consoleSelected?.name
        }
    }
    
    @IBAction func onTappedBtnAddAndEdit(_ sender: UIButton) {
        if validateForm() {
            if game == nil {
                game = Game(context: context)
            }
            game?.name = nameField.text
            game?.releaseDate = calendarPicker.date
            game?.cover = uiImage.image
            game?.console = consoleSelected
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
        return consoleManager.consoles.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return consoleManager.consoles[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        consoleSelected = consoleManager.consoles[row]
        inputPlatform.text = consoleManager.consoles[row].name
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

