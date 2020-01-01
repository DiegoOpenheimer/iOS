//
//  DetailGameViewController.swift
//  MyGame
//
//  Created by Diego Alves Openheimer on 01/01/20.
//  Copyright © 2020 Diego Alves Openheimer. All rights reserved.
//

import UIKit

class DetailGameViewController: UIViewController {
    
    var game: Game?
    
    @IBOutlet weak var calendarLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cover: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = game?.name
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        nameLabel.text = game?.name
        if let cover = game?.cover as? UIImage {
            self.cover.image = cover
        } else {
            cover.image = UIImage(named: "noCoverFull")
        }
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        if let date = game?.releaseDate {
            calendarLabel.text = formatter.string(from: date)
        } else {
            calendarLabel.text = "Desconhecido"
        }
        cover.layer.cornerRadius = 10
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueDetailToEdit" {
            let vc = segue.destination as? GameViewController
            vc?.game = game
        }
    }

}
