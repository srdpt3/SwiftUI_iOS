//
//  Users.swift
//  Gleem_Dating
//
//  Created by Dustin yang on 6/29/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//

import Foundation
import FirebaseAuth

struct User: Encodable, Decodable {
    var uid : String
    var email: String
    var profileImageUrl: String
    var username: String
    var bio: String
    var keywords: [String]
    
    
    
init(uid: String, email: String, profileImageUrl: String, username: String, bio: String,keywords: [String]) {
    self.uid = uid
    self.email = email
    self.profileImageUrl = profileImageUrl
    self.username = username
    self.bio = bio
    self.keywords = keywords


}
    init(_dictionary: NSDictionary) {
        uid = _dictionary["uid"] as! String
        email = _dictionary["email"] as! String
        profileImageUrl = _dictionary["profileImageUrl"] as! String
        username = _dictionary["username"] as! String
        bio = _dictionary["bio"] as! String
        keywords = _dictionary["keywords"] as! [String]

    }
//
//    static func convertDictToUserStruct(dict: [String: Any]) -> User {
//        let bio = dict["bio"] as! String
//        let email = dict["email"] as! String
//        let profileImageUrl = dict["profileImageUrl"] as! String
//        let username = dict["username"] as! String
//        let keywords = dict["keywords"] as! [String]
//        let uid = dict["uid"] as! String
//
//        let user = User.init(uid: uid, email: email, profileImageUrl: profileImageUrl, username: username, bio: bio, keywords: keywords)
//        return user
//    }
    

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
