//
//  CreateTweet.swift
//  TwitterClone
//
//  Created by Dustin yang on 5/14/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//

import SwiftUI

import SwiftUI
import Firebase

struct CreateTweet : View {
    @Binding var show : Bool
    @State var txt = ""

    var body : some View{

        VStack{
            
            HStack{
                
                Button(action: {
                        
                    self.show.toggle()
                    
                }) {
                    
                    Text("Cancel")
                }
                
                Spacer()
                
                Button(action: {
                    
                    
                    postTweet(msg: self.txt)
                    self.show.toggle()
                    
                }) {
                    
                    Text("Tweet").padding()
                    
                }.background(Color("bg"))
                .foregroundColor(.white)
                .clipShape(Capsule())
            }
            
           multilineTextField(txt: $txt)
            
        }.padding()
    }
}
//
//
//struct CreateTweet_Previews: PreviewProvider {
//    static var previews: some View {
//        CreateTweet()
//    }
//}
