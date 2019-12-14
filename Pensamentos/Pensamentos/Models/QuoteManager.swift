//
//  QuoteManager.swift
//  Pensamentos
//
//  Created by Diego Alves Openheimer on 14/12/19.
//  Copyright © 2019 Diego Alves Openheimer. All rights reserved.
//

import Foundation

class QuoteManager {
    
    var quotes: [ Quote ]
    
    init() {
        let path = Bundle.main.path(forResource: "quotes", ofType: "json")
        let data = try! Data(contentsOf: URL(fileURLWithPath: path!))
        quotes = try! JSONDecoder().decode([ Quote ].self, from: data)
    }
    
    func getRandomQuote() -> Quote {
        return quotes.randomElement()!
    }
    
}
