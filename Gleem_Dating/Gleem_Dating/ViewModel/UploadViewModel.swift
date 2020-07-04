//
//  UploadViewModel.swift
//  Gleem_Dating
//
//  Created by Dustin yang on 7/1/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//

import SwiftUI

class UploadViewModel: ObservableObject {
    @Published var isSucess = false
    @Published var isLoading = false
    //     var buttonPressed = [Bool]()
    var selectedButton = [String]()
    func persist(buttonPressed : [Bool], buttonTitle : [String]) {
        
        for (index, button) in buttonPressed.enumerated() {
            if (button){
                print("\(index + 1). \(buttonTitle[index])")
                
                
            }
        }
        let date: Double = Date().timeIntervalSince1970

        let myVote = Vote(attr1: 0, attr2 : 0 , attr3 : 1 , attr4: 0, attr5: 0,attrNames:buttonTitle, numVote: 0, createdDate: date, lastModifiedDate: date)
        
        
//        let myVote = Vote(attr1: 0, attr2 : 0 , attr3 : 1 , attr4: 0, attr5: 0,attrNames:buttonTitle, numVote: 0, )

        guard let dict = try? myVote.toDictionary() else {return}
        
        
        Ref.FIRESTORE_COLLECTION_MYVOTE.document("test").setData(dict) { (error) in
            if error == nil {
                print("persist sucessfully to my vote")
                self.isSucess = true
            }
        }
        
        
        
    }
}



