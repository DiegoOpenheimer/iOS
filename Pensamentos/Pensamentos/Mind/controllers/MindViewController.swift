//
//  MindViewController.swift
//  Pensamentos
//
//  Created by Diego Alves Openheimer on 14/12/19.
//  Copyright © 2019 Diego Alves Openheimer. All rights reserved.
//

import UIKit

class MindViewController: UIViewController {

    let quoteManager = QuoteManager()
    let configuration = Configuration.shared
    var timer: Timer?
    
    @IBOutlet weak var imAuthor: UIImageView!
    @IBOutlet weak var imBackground: UIImageView!
    @IBOutlet weak var lbMind: UILabel!
    @IBOutlet weak var lbAuthor: UILabel!
    @IBOutlet weak var ctLbMind: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        prepareMinds()
        startTimer()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        prepareMinds()
        startTimer()
    }
    
    func prepareMinds() {
        let quote = quoteManager.getRandomQuote()
        imAuthor.image = UIImage(named: quote.image)
        imBackground.image = imAuthor.image
        lbMind.text = quote.quote
        lbAuthor.text = quote.author
        view.backgroundColor = configuration.colorScheme == 0 ? .white : UIColor(red: 156.0/255.0, green: 68.0/255.0, blue: 15.0/255.0, alpha: 1.0)
        lbMind.textColor = configuration.colorScheme == 0 ? .darkText : .white
        animateItems()
    }
    
    func startTimer() {
        timer?.invalidate()
        if configuration.automatic {
            timer = Timer.scheduledTimer(withTimeInterval: Double(configuration.time == 0 ? 3 : configuration.time), repeats: true, block: {_ in
                self.prepareMinds()
            })
        }
    }
    
    func animateItems() {
        imAuthor.alpha = 0.0
        lbMind.alpha = 0.0
        lbAuthor.alpha = 0.0
        ctLbMind.constant = 50
        view.layoutIfNeeded()
        
        UIView.animate(withDuration: 1) {
            self.imAuthor.alpha = 1.0
            self.lbMind.alpha = 1.0
            self.lbAuthor.alpha = 1.0
            self.ctLbMind.constant = 10
            self.view.layoutIfNeeded()
        }
    }
    

}
