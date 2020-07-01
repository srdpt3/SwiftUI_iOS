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
        
        
          HStack(spacing: 20){
              Button(action: {

              }){
                  Image("gleem_resized").resizable().frame(width: 110, height: 45)

              }.buttonStyle(PlainButtonStyle())

              Spacer()
              Button(action: {

              }){
                  Image(systemName: "magnifyingglass").resizable().frame(width: 20, height: 22).foregroundColor(.white)
              }

              Button(action: {

              }){
                  Image(systemName: "flag").resizable().frame(width: 20, height: 22).foregroundColor(.white)
              }
          }
          .padding()
         .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top).background(Color("Color-5"))
          
    }
}
