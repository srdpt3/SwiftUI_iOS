//
//  TweetCellTop.swift
//  TwitterClone
//
//  Created by Dustin yang on 5/14/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct tweetCellTop : View {
    
    var name = ""
    var id = ""
    var pic = ""
    var image = ""
    var msg = ""
    
    var body : some View{
        
        HStack(alignment: .top){
            
            VStack{
                
                AnimatedImage(url: URL(string: "https://dimg.donga.com/wps/ECONOMY/IMAGE/2020/03/20/100259164.2.jpg")!).resizable().frame(width: 50, height: 50).clipShape(Circle())

            }

            
            VStack(alignment: .leading){
                
                Text(name).fontWeight(.heavy)
                Text(id)
                Text(msg).padding(.top, 8)
                
            }
            
        }.padding()
    }
}

struct tweetCellBottom : View {
    
    var body : some View{
        
        HStack(spacing : 40){
            
            Button(action: {
                
            }) {
                
                Image("Comments").resizable().frame(width: 20, height: 20)
                
            }.foregroundColor(.gray)
            
            Button(action: {
                
            }) {
                
                Image("Retweet").resizable().frame(width: 20, height: 20)
                
            }.foregroundColor(.gray)
            
            Button(action: {
                
            }) {
                
                Image("love").resizable().frame(width: 20, height: 17)
                
            }.foregroundColor(.gray)
            
            Button(action: {
                
            }) {
                
                Image("upload").resizable().frame(width: 20, height: 20)
                
            }.foregroundColor(.gray)
        }
    }
}

//TweetCellMiddle.swift

import SwiftUI
import SDWebImageSwiftUI


struct tweetCellMiddle : View {
    
    var pic = ""
    
    var body : some View{
        
        AnimatedImage(url: URL(string: pic)!).resizable().frame(height: 300).cornerRadius(20).padding()
    }
}
