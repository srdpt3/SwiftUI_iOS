//
//  TopView.swift
//  Gleem_Dating
//
//  Created by Dustin yang on 6/28/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//

import SwiftUI

struct TopView : View {
    
    @Binding var show : Bool
    
    var body : some View{
        
        HStack{
            
            Button(action: {
                
            }) {
                
                Image("person").resizable().frame(width: 35, height: 35)
                
            }.foregroundColor(.gray)
            
            Spacer()
            
            Button(action: {
                
            }) {
                
                Image(systemName: "flame.fill").resizable().frame(width: 30, height: 35)
                
            }.foregroundColor(.red)
            
            
            Spacer()
            
            Button(action: {
                
                self.show.toggle()
                
            }) {
                
                Image("chat").resizable().frame(width: 35, height: 35)
                
            }.foregroundColor(.gray)
            
        }.padding()
    }
}
