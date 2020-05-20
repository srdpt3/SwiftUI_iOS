//
//  FirebaseReference.swift
//  iCoffee
//
//  Created by David Kababyan on 05/01/2020.
//  Copyright © 2020 David Kababyan. All rights reserved.
//

import Foundation
import FirebaseFirestore

enum FCollectionReference: String {
    case User
    case Menu
    case Order
    case Basket
}

func FirebaseReference(_ collectionReference: FCollectionReference) -> CollectionReference {
    
    return Firestore.firestore().collection(collectionReference.rawValue)
}
