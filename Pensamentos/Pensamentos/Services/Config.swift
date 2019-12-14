//
//  Config.swift
//  Pensamentos
//
//  Created by Diego Alves Openheimer on 14/12/19.
//  Copyright © 2019 Diego Alves Openheimer. All rights reserved.
//

import Foundation

enum AppConfiguration: String {
    
    case automatic = "automatic"
    case timeToChangeMind = "timeToChangeMind"
    case colorScheme = "colorScheme"
    
}

class Configuration {
    
    private let defaults = UserDefaults.standard
    static let shared = Configuration()
    
    var automatic: Bool {
        get {
            return defaults.bool(forKey: AppConfiguration.automatic.rawValue)
        }
        set {
            defaults.set(newValue, forKey: AppConfiguration.automatic.rawValue)
        }
    }
    
    var time: Int {
        get {
            return defaults.integer(forKey: AppConfiguration.timeToChangeMind.rawValue)
        }
        set {
            defaults.set(newValue, forKey: AppConfiguration.timeToChangeMind.rawValue)
        }
    }
    
    var colorScheme: Int {
        get {
            return defaults.integer(forKey: AppConfiguration.colorScheme.rawValue)
        }
        set {
            defaults.set(newValue, forKey: AppConfiguration.colorScheme.rawValue)
        }
    }
    
    private init() {
        
    }
    
}


