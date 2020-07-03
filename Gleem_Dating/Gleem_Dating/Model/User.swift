//
//  Users.swift
//  Gleem_Dating
//
//  Created by Dustin yang on 6/29/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//

import Foundation
import FirebaseAuth

struct User: Encodable, Decodable ,Identifiable{
//    var id: ObjectIdentifier
    
    var id : String
    var email: String
    var profileImageUrl: String
    var username: String
    var age: String
    var swipe : CGFloat
    var degree : CGFloat

    
    init(id: String, email: String, profileImageUrl: String, username: String, age: String,swipe:CGFloat, degree: CGFloat) {
        self.id = id
        self.email = email
        self.profileImageUrl = profileImageUrl
        self.username = username
        self.age = age
        self.swipe = swipe
        self.degree = degree
        
        
    }
    init(_dictionary: NSDictionary) {
        id = _dictionary["id"] as! String
        email = _dictionary["email"] as! String
        profileImageUrl = _dictionary["profileImageUrl"] as! String
        username = _dictionary["username"] as! String
        age = _dictionary["age"] as! String
        swipe = _dictionary["swipe"] as! CGFloat
        degree = _dictionary["username"] as! CGFloat
        
    }

    
    static func currentUser() -> User? {
        
        if Auth.auth().currentUser != nil {
            if let dictionary = UserDefaults.standard.object(forKey: "currentUser") {
                print(User.init(_dictionary: dictionary as! NSDictionary))
                
                return User.init(_dictionary: dictionary as! NSDictionary)
            }
        }
        
        return nil
    }
    
    
    
}
