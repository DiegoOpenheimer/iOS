//
//  GameTableViewCell.swift
//  MyGame
//
//  Created by Diego Alves Openheimer on 31/12/19.
//  Copyright © 2019 Diego Alves Openheimer. All rights reserved.
//

import UIKit

class GameTableViewCell: UITableViewCell {

    @IBOutlet weak var viewLabel: UIView!
    @IBOutlet weak var cover: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    /**
     prepate game cell
     - parameter game: game object to build the cell with information about it
     */
    func prepare(with game: Game) {
        if let image = game.cover as? UIImage {
            cover.image = image
        } else {
            cover.image = UIImage(named: "noCover")
        }
        label.text = game.name
        let thickness: CGFloat = 1.0
          let bottomBorder = CALayer()
          bottomBorder.frame = CGRect(x:0, y: viewLabel.frame.size.height - thickness, width: viewLabel.frame.size.width, height:thickness)
        if #available(iOS 13.0, *) {
            bottomBorder.backgroundColor = UIColor.opaqueSeparator.cgColor
        } else {
            bottomBorder.backgroundColor = UIColor.lightGray.cgColor
        }
          viewLabel.layer.addSublayer(bottomBorder)

    }
    
}
