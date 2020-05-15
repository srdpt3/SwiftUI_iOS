//
//  Datatypes.swift
//  TwitterClone
//
//  Created by Dustin yang on 5/14/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//

import Foundation

struct datatype : Identifiable {
    
    var id : String
    var name : String
    var msg : String
    var retweets : String
    var likes : String
    var pic : String
    var url : String
    var tagId : String
}

struct Topdatatype : Identifiable {
    
    var id : String
    var tag : String
    var tweets : String
}
