//
//  SettingsViewController.swift
//  Pensamentos
//
//  Created by Diego Alves Openheimer on 14/12/19.
//  Copyright © 2019 Diego Alves Openheimer. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    let configuration: Configuration = Configuration.shared
    
    @IBOutlet weak var btnToggle: UISwitch!
    @IBOutlet weak var uiSegment: UISegmentedControl!
    @IBOutlet weak var uiSlider: UISlider!
    @IBOutlet weak var lbTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter
            .default
            .addObserver(self, selector: #selector(initialize), name: Notification.Name(Notifications.becomeActive), object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        initialize()
    }
    
    @objc private func initialize() {
        print("start")
        btnToggle.setOn(configuration.automatic, animated: false)
        uiSegment.selectedSegmentIndex = configuration.colorScheme
        lbTime.text = "Mudar após \(configuration.time) segundos"
        uiSlider.setValue(Float(configuration.time), animated: false)
    }
    
    @IBAction func onChangeSlider(_ sender: UISlider) {
        let value = Int(sender.value)
        lbTime.text = "Mudar após \(value) segundos"
        configuration.time = value
    }
    
    @IBAction func onChangeSwitch(_ sender: UISwitch) {
        configuration.automatic = sender.isOn
    }
    @IBAction func onChangeSegment(_ sender: UISegmentedControl) {
        configuration.colorScheme = sender.selectedSegmentIndex
    }
    
}
