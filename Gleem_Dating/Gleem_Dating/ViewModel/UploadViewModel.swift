//
//  UploadViewModel.swift
//  Gleem_Dating
//
//  Created by Dustin yang on 7/1/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//

import SwiftUI

class UploadViewModel: ObservableObject {
    @Published var isLoading = false
//     var buttonPressed = [Bool]()
    var selectedButton = [String]()
    func persist(buttonPressed : [Bool], buttonTitle : [String]) {
        
        for (index, button) in buttonPressed.enumerated() {
            if (button){
                print("\(index + 1). \(buttonTitle[index])")

            }
        }

//        if selectedButton.count > 4 {
//
//            print("asdfasdf")
//        }
        
      }
}



