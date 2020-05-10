//
//  SettingDefaults.swift
//  DistanceEval
//
//  Created by Dustin yang on 5/10/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//

import Foundation

@propertyWrapper
struct SettingDefault<T> {
    let key: String
    let defaultValue : T
    
    init(_ key: String, defaultValue: T){
        self.key = key
        self.defaultValue = defaultValue
    }
    
    
    
    var wrappedValue: T {
        get{
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        
        set{
            UserDefaults.standard.set(newValue, forKey:  key)
        }
    }
}
