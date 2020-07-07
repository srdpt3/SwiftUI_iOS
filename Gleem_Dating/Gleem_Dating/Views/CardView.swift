//
//  CardView.swift
//  Gleem_Dating
//
//  Created by Dustin yang on 7/7/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//

import SwiftUI

struct CardView: View {
    
    @State var showLiked = false
    @State var showBlockAlert = false
    @EnvironmentObject var obs : observer

    var body: some View{
        
        ZStack{
            
            
            
            VStack{
                
         
                    
                    Group {
//                        TopView(show: $showLiked).padding(.bottom, -30)
                        
                        SwipeView().padding(.bottom, 10).padding(.top, 10)
                        
                        
                        
                        BottomView().listRowInsets(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
                        
                        
                    }
                    //                    TopView(show: $showLiked).padding(.bottom, -15)
                    //
                    //                        SwipeView(users: self.obs.users).padding(.bottom, 10).padding(.top, 10)
                    //
                    //
                    //
                    //                    BottomView().listRowInsets(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
                    
                
                
                
                
                
                
            }
            
        }.padding(.bottom, 5)
//        .navigationTitle("").navigationBarHidden(true)
        .navigationBarTitle(Text("Messages"), displayMode: .inline)
    }
}

