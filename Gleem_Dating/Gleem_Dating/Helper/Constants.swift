//
//  Constants.swift
//  Gleem_Dating
//
//  Created by Dustin yang on 6/29/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseStorage

let COLOR_LIGHT_GRAY = Color(red: 0, green: 0, blue: 0, opacity: 0.15)



// Sign in and Sign up pages
let TEXT_NEED_AN_ACCOUNT = "Don't have an account?"
let TEXT_SIGN_UP = "Sign up"
let TEXT_SIGN_IN = "Sign in"
let TEXT_EMAIL = "Email"
let TEXT_USERNAME = "Username"
let TEXT_PASSWORD = "Password"
let TEXT_SIGNIN_HEADLINE = "Photo Sharing"
let TEXT_SIGNIN_SUBHEADLINE = "The essiest way to share photos with family and friends"
let TEXT_SIGNUP_NOTE = "An account will allow you to save and access photo information across devices. You can delete your account at any time and your information will not be shared."
let TEXT_SIGNUP_PASSWORD_REQUIRED = "At least 8 characters required"


let IMAGE_LOGO = "logo"
let IMAGE_USER_PLACEHOLDER = "user-placeholder"
let IMAGE_PHOTO = "plus.circle"

//FLAG
public let BLOCKUSER = "신고해주셔서 감사합니다"
//Vote
public let VOTE_NUMBER = "numVote"
public let CHART_Y_AXIS = 100


//Chart
public let SERIES_TITLE = "매력지수(%)"


class Ref {
    // Storage
    static var STORAGE_ROOT = Storage.storage().reference(forURL: "gs://gleem-dating.appspot.com")
    

    
    // Storage - Posts
    static var STORAGE_POSTS = STORAGE_ROOT.child("posts")
    static func STORAGE_POST_ID(postId: String) -> StorageReference {
        return STORAGE_POSTS.child(postId)
    }
    
    // Storage - Chat
    static var STORAGE_CHAT = STORAGE_ROOT.child("chat")
    static func STORAGE_CHAT_ID(chatId: String) -> StorageReference {
        return STORAGE_CHAT.child(chatId)
    }
    
    
    // Firestore
    static var FIRESTORE_ROOT = Firestore.firestore()
    
    // Firestore - Users
    static var FIRESTORE_COLLECTION_USERS = FIRESTORE_ROOT.collection("users")
    static func FIRESTORE_DOCUMENT_USERID(userId: String) -> DocumentReference {
        return FIRESTORE_COLLECTION_USERS.document(userId)
    }
    
    
    static var FIRESTORE_COLLECTION_TIMELINE = FIRESTORE_ROOT.collection("timeline")
    static func FIRESTORE_TIMELINE_DOCUMENT_USERID(userId: String) -> DocumentReference {
        return FIRESTORE_COLLECTION_TIMELINE.document(userId)
    }
    
    static var FIRESTORE_COLLECTION_ALL_POSTS = FIRESTORE_ROOT.collection("all_posts")
    
    
    static var FIRESTORE_COLLECTION_CHAT = FIRESTORE_ROOT.collection("chat")
    static func FIRESTORE_COLLECTION_CHATROOM(senderId: String, recipientId: String) -> CollectionReference {
        return FIRESTORE_COLLECTION_CHAT.document(senderId).collection("chatRoom").document(recipientId).collection("chatItems")
    }
    static var FIRESTORE_COLLECTION_INBOX_MESSAGES = FIRESTORE_ROOT.collection("messages")
    static func FIRESTORE_COLLECTION_INBOX_MESSAGES(userId: String) -> CollectionReference {
        return FIRESTORE_COLLECTION_INBOX_MESSAGES.document(userId).collection("inboxMessages")
    }
    
    
    static func FIRESTORE_COLLECTION_INBOX_MESSAGES_DOCUMENT_USERID(senderId: String, recipientId: String) -> DocumentReference {
        return FIRESTORE_COLLECTION_INBOX_MESSAGES.document(senderId).collection("inboxMessages").document(recipientId)
    }
    
    static var FIRESTORE_COLLECTION_FOLLOWING = FIRESTORE_ROOT.collection("following")
    static func FIRESTORE_COLLECTION_FOLLOWING_USERID(userId: String) -> DocumentReference {
        return FIRESTORE_COLLECTION_FOLLOWING.document(Auth.auth().currentUser!.uid).collection("userFollowing").document(userId)
    }
    static func FIRESTORE_COLLECTION_FOLLOWING(userId: String) -> CollectionReference {
        return FIRESTORE_COLLECTION_FOLLOWING.document(userId).collection("userFollowing")
    }
    
    
    
    
    static var FIRESTORE_COLLECTION_FOLLOWERS = FIRESTORE_ROOT.collection("followers")
    static func FIRESTORE_COLLECTION_FOLLOWERS_USERID(userId: String) -> DocumentReference {
        return FIRESTORE_COLLECTION_FOLLOWERS.document(userId).collection("userFollowers").document(Auth.auth().currentUser!.uid)
    }
    static func FIRESTORE_COLLECTION_FOLLOWERS(userId: String) -> CollectionReference {
        return FIRESTORE_COLLECTION_FOLLOWERS.document(userId).collection("userFollowers")
    }
    
    
    // Storage - Avatar
    static var STORAGE_AVATAR = STORAGE_ROOT.child("avatar")
    static func STORAGE_AVATAR_USERID(userId: String) -> StorageReference {
        return STORAGE_AVATAR.child(userId)
    }
    
    static var STORAGE_VOTE_PIC = STORAGE_ROOT.child("votepictures")
    static func STORAGE_VOTE_PIC_USERID(userId: String) -> StorageReference {
        return STORAGE_VOTE_PIC.child(userId)
    }
    
    
    static var FIRESTORE_COLLECTION_VOTE = FIRESTORE_ROOT.collection("vote")
    static func FIRESTORE_COLLECTION_VOTE_USERID(userId: String) -> DocumentReference {
        return FIRESTORE_COLLECTION_VOTE.document(userId)
    }
    
    static var FIRESTORE_COLLECTION_MYVOTE = FIRESTORE_ROOT.collection("myvote")
    static func FIRESTORE_COLLECTION_MYVOTE_USERID(userId: String) -> DocumentReference {
        return FIRESTORE_COLLECTION_MYVOTE.document("dustin").collection("voted").document(userId)
    }
    
    
    static var FIRESTORE_COLLECTION_ATTRIBUTE = FIRESTORE_ROOT.collection("Attributes")
    static func FIRESTORE_COLLECTION_ATTRIBUTE_MALE() -> DocumentReference {
        return FIRESTORE_COLLECTION_VOTE.document("male")
    }
    
    static func FIRESTORE_COLLECTION_ATTRIBUTE_FEMALE() -> DocumentReference {
        return FIRESTORE_COLLECTION_ATTRIBUTE.document("female")
    }
    
    static var FIRESTORE_COLLECTION_SOMEOME_LIKED = FIRESTORE_ROOT.collection("someone_liked")
    static func FIRESTORE_COLLECTION_SOMEOME_LIKED_USERID(userId: String) -> DocumentReference {
        return FIRESTORE_COLLECTION_SOMEOME_LIKED.document(userId).collection("liked").document(User.currentUser()!.id)
    }
    
    static var FIRESTORE_COLLECTION_LIKED = FIRESTORE_ROOT.collection("liked")
    static func FIRESTORE_COLLECTION_LIKED_USERID(userId: String) -> DocumentReference {
        return FIRESTORE_COLLECTION_LIKED.document(User.currentUser()!.id).collection("liked").document(userId)


    }
    
    
  static func FIRESTORE_GET_LIKED_USERID_COLLECTION(userId: String) -> CollectionReference {
     return FIRESTORE_COLLECTION_LIKED.document(userId).collection("liked")
  }
    
    //    static func FIRESTORE_GET_VOTE() -> DocumentReference {
    //       return FIRESTORE_COLLECTION_VOTE.document(userId)
    //    }
}
