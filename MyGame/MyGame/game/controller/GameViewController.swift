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
        print("okay")
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

