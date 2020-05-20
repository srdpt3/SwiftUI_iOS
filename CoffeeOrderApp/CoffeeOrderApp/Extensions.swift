//
//  Extensions.swift
//  iCoffee
//
//  Created by David Kababyan on 06/01/2020.
//  Copyright © 2020 David Kababyan. All rights reserved.
//

import Foundation

extension Double {
    var clean: String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
