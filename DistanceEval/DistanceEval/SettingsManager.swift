//
//  SettingsManager.swift
//  DistanceEval
//
//  Created by Dustin yang on 5/10/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//

import Foundation
import Combine

class SettingsManager : ObservableObject{
    
    let objectWillChange  = PassthroughSubject<Void, Never>()
    
    @SettingDefault("travelRadius", defaultValue: 300)
    var travelRadius : Double {
        willSet{
            objectWillChange.send()
        }
    }
}
