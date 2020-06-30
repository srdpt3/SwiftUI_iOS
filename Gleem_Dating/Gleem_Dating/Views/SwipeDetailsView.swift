//
//  SwipeDetailsView.swift
//  Gleem_Dating
//
//  Created by Dustin yang on 6/28/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//
import SwiftUI
import SDWebImageSwiftUI


struct SwipeDetailsView : View {
    
    var name = ""
    var age = ""
    var image = ""
    var height : CGFloat = 0
    
    var body : some View{
        
        ZStack{
            
            AnimatedImage(url: URL(string: image)!).resizable().frame(width: (UIScreen.main.bounds.width )/1.2, height: (UIScreen.main.bounds.height ) / 1.7).cornerRadius(20).padding(.horizontal, 15)
            
            VStack{
                
                Spacer()
                
                HStack{
                    
                    VStack(alignment: .leading, content: {
                        
                        Text(name).font(.system(size: 25)).fontWeight(.heavy).foregroundColor(.white)
                        Text(age).foregroundColor(.white)
                    })
                    
                    Spacer()
                }
                
                }.padding(.leading, 35).padding(.bottom, 20)
            
            
        }.frame(height: height)
        
    }
}
