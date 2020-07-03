//
//  SwipeView.swift
//  Gleem_Dating
//
//  Created by Dustin yang on 6/28/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//

import SwiftUI


struct SwipeView : View {
    
    @EnvironmentObject var obser : observer
    @State var vote  = false
    var users : [User]
    var body : some View{
        
        GeometryReader{ geo in
            
            ZStack{
                
                //                ForEach(self.obser.users){i in
                ForEach(self.users) {i in
                    
                    
                    SwipeDetailsView(name: i.username, age: i.age, image: i.profileImageUrl, height: geo.size.height - 100)
                        
                        .gesture(DragGesture()
                            
                            .onChanged({ (value) in
                                
                                if value.translation.width > 0{
                                    
                                    self.obser.update2(id: i, value: value.translation.width, degree: 8)
                                }
                                else{
                                    
                                    self.obser.update2(id: i, value: value.translation.width, degree: -8)
                                }
                                
                            }).onEnded({ (value) in
                                self.obser.update2(id: i, value: 0, degree: 0)
                                
                                
                                
                            })
                    ).offset(x: i.swipe)
//                        .rotationEffect(.init(degrees: i.degree))
                        .rotationEffect(.init(degrees: i.swipe == 0 ? 0 : (i.swipe > 0 ? 8 : -8)))

                     .animation(
                        Animation.easeInOut(duration: 0.5)
                                .delay(0)
                        )
                    
                }
                
            }
        }
    }
}
