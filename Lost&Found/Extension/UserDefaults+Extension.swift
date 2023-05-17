//
//  UserDefaults+Extension.swift
//  Lost&Found
//
//  Created by Agnesa  on 17.5.23.
//

import Foundation

extension UserDefaults {
    private enum UserDefaultsKeys: String {
        case isIntroScreen
    }
    
    var isIntroScreen: Bool {
        get {
            bool(forKey: UserDefaultsKeys.isIntroScreen.rawValue)
        }
        
        set {
            setValue(newValue, forKey: UserDefaultsKeys.isIntroScreen.rawValue)
        }
    }
}
