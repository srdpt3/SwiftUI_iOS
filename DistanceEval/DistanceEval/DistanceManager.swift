//
//  DistanceManager.swift
//  DistanceEval
//
//  Created by Dustin yang on 5/9/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//

import Foundation
import CoreLocation

class DistanceManager: NSObject, ObservableObject{
    @Published var distance: Double? = 0
    
    func distance(_ locations:[CLLocation]){
        if let locationA = locations.first, let locationB = locations.last{
            self.distance = Double(locationA.distance(from: locationB) / 1000)
        }
    }
    
}

extension CLLocation{
    var latitude : Double {
        return self.coordinate.latitude
    }
    
    var longitude: Double{
        return self.coordinate.longitude
    }
}
