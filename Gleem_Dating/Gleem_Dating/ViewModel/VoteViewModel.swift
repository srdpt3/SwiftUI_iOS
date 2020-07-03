//
//  VoteViewModel.swift
//  Gleem_Dating
//
//  Created by Dustin yang on 7/2/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//

import SwiftUI
import Firebase

class VoteViewModel: ObservableObject {
    @Published var isSucess = false
    @Published var error: NSError?
    
    @Published var isLoading = false
    //     var buttonPressed = [Bool]()
    var updatedValueDict = ["attr1":0 , "attr2":0, "attr3":0, "attr4":0, "attr5":0]
    
    func persist(id: String , buttonPressed : [Bool], buttonTitle : [String]) {
        
        //batch writing. vote multiple entries
        let batch = Ref.FIRESTORE_ROOT.batch()
         let sRef = Ref.FIRESTORE_COLLECTION_MYVOTE.document(id)
        for (index, button) in buttonPressed.enumerated() {
            if (button){
                print("\(index + 1). \(buttonTitle[index])")
                 batch.updateData([updatedValueDict[index].key : FieldValue.increment(Int64(1))], forDocument: sRef)
                            }
        }
//        let myVote = Vote(attr1: 0, attr2 : 0 , attr3 : 1 , attr4: 2, attr5: 0,attrNames:buttonTitle)
//        guard let dict = try? myVote.toDictionary() else {return}
        
        
//        Ref.FIRESTORE_COLLECTION_MYVOTE.document(id).setData(dict) { (error) in
//            if error == nil {
//                print("persist sucessfully to my vote")
//                self.isSucess = true
//            }else{
//                self.error = error as! NSError
//
//            }
//        }
//
       
        batch.commit() { err in
            if let err = err {
                print("Error writing batch \(err)")
            } else {
                print("Batch write succeeded.")
                self.isSucess = true
            }
        }

        
        
    }
    
}

