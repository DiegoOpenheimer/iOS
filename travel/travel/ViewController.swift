//
//  ViewController.swift
//  travel
//
//  Created by Diego Alves Openheimer on 16/10/19.
//  Copyright © 2019 Diego Alves Openheimer. All rights reserved.
//

import UIKit
import Toast_Swift

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
     
    
    private let travelDAO = TravelDAO()
    
  
    @IBOutlet var tableView: UITableView?
    @IBOutlet var buttonHotel: UIView?
    @IBOutlet var buttonPackages: UIView?

    override func viewDidLoad() {
        super.viewDidLoad()
        buttonHotel?.layer.cornerRadius = 10
        buttonPackages?.layer.cornerRadius = 10
        let gestureTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(onPressBtnHotel))
        buttonHotel?.addGestureRecognizer(gestureTapRecognizer)
    }
    
    @objc func onPressBtnHotel(_ sender: UITapGestureRecognizer) {
        self.view.makeToast("Hotel clicked", duration: 3, position: .bottom)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return travelDAO.getTravels().count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let travels = travelDAO.getTravels()
        let row = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "TravelTableViewCell", for: indexPath) as! TravelTableViewCell
        let travel = travels[row]
        cell.titleLabel?.text = travel.title
        cell.priceLabel?.text = String(travel.price)
        cell.timeLabel?.text = "\(travel.amountDays) days"
        cell.travelImageView?.layer.cornerRadius = 10
        cell.travelImageView?.image = UIImage(named: travel.pathImage)
        return cell
      }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175
    }

}

