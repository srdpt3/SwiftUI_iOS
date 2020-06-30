//
//  BottomView.swift
//  Gleem_Dating
//
//  Created by Dustin yang on 6/28/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//

import SwiftUI

struct BottomView : View {
    
    @EnvironmentObject var obs : observer
    @State var show = false
    @State var index = 0
    
    
    @State var x : CGFloat = 0
    @State var count : CGFloat = 0
    @State var screen = UIScreen.main.bounds.width - 30
    @State var op : CGFloat = 0
    @State var selectedCard: datatype?
    @State var bottomDragState: CGSize = .zero
    var heightBanner = (UIScreen.main.bounds.height * 0.65)
    @State var showFull = false
    
    
    var body : some View{
        
         ZStack {
              
              HStack{
                  
                  Button(action: {
                      
                      //                if self.obs.last != -1{
                      //
                      //                    self.obs.updateDB(id: self.obs.users[self.obs.last], status: "")
                      //                }
                      self.obs.reload()
                  }) {
                      
                      Image("reload").resizable().frame(width: 20, height: 20).padding()
                      
                  }.foregroundColor(.yellow)
                      .background(Color.white)
                      .shadow(radius: 25)
                      .clipShape(Circle())
                  
                  //            Button(action: {
                  //
                  //                if self.obs.last == -1{
                  //
                  //                    //intial user...
                  //                    self.obs.updateDB(id: self.obs.users[self.obs.users.count - 1], status: "reject")
                  //                }
                  //                else{
                  //
                  //                    // if last user index is 4 means current user index will be 4-1 = 3
                  //                self.obs.updateDB(id: self.obs.users[self.obs.last - 1], status: "reject")
                  //
                  //                }
                  //
                  //            }) {
                  //
                  //                Image("clear").resizable().frame(width: 30, height: 30).padding()
                  //
                  //            }.foregroundColor(.pink)
                  //            .background(Color.white)
                  //            .shadow(radius: 25)
                  //            .clipShape(Circle())
                  
                  Button(action: {
                      // ACTION
                      
                     self.show.toggle()
                      
                      self.selectedCard = self.obs.users[0]
                      
                  }) {
                    
                      Text("첫인상 투표".uppercased())
                          .font(.system(.subheadline, design: .rounded))
                          .fontWeight(.heavy)
                          .padding(.horizontal, 50)
                          .padding(.vertical, 12)
                          .accentColor(Color.pink)
                          .background(
                              Capsule().stroke(Color.pink, lineWidth: 2)
                      )
                  }
                  
                  Button(action: {
                      //                print(self.obs.users.count)
                      //                if (self.obs.users.count > 0){
                      //                    let index = self.obs.users.count - 1
                      //                    self.obs.users[index].swipe = 500
                      //                }
                      // same here also....
                      
                      if self.obs.last == -1{
                        
                          print("aaa")
                          //intial user...
                          self.obs.update(id: self.obs.users[self.obs.users.count - 1], value: 500, degree: 0)
                          self.obs.updateDB(id: self.obs.users[self.obs.users.count - 1], status: "liked")
                      }
                      else{
                          if(self.obs.last  > 0){
                              print("bbbb \(self.obs.last )")
                              print("bbb")
                              
                              // if last user index is 4 means current user index will be 4-1 = 3
                              self.obs.updateDB(id: self.obs.users[self.obs.last - 1], status: "voted")
                              self.obs.update(id: self.obs.users[self.obs.last - 1], value: 500, degree: 0)

                          }
                          
                          
                          
                      }
                      
                  }) {
                      
                      Image(systemName: "arrow.right").resizable().frame(width: 20, height: 20).padding()
                      
                  }.foregroundColor(.black)
                      .background(Color.white)
                      .shadow(radius: 25)
                      .clipShape(Circle())
             
                  
                  
                  //            Button(action: {
                  //
                  //
                  //            }) {
                  //
                  //                Image("current").resizable().frame(width: 25, height: 25).padding()
                  //
                  //            }.foregroundColor(.purple)
                  //            .background(Color.white)
                  //            .shadow(radius: 25)
                  //            .clipShape(Circle())
              }
//            .blur(radius: self.selectedCard == nil ? 0 : 50)
//                        ZStack {
//                            Rectangle().fill(Color.clear)
//                            if self.selectedCard?.image != nil {
//                                Image(self.selectedCard!.image)
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fill)
//                            }
//                        }
//                        .frame(width: screen2.bounds.width)
//                        .frame(height:screen2 == nil ? nil : self.heightBanner)
//                        .offset(y: self.selectedCard == nil ? -screen2.bounds.height : (self.heightBanner / 2) - (screen2.bounds.height / 2))
//                        .opacity(self.selectedCard == nil ? 0.5 : 1)
//                        .blur(radius: self.bottomDragState.height > 0 ? min(self.bottomDragState.height, 50) : 0)
//                        .animation(.easeInOut)
                        
//            if(show){
////                ExpandView
//                ExpandView(data: self.obs.users[0], show: self.$show)
//                    //shrinking the view in background...
//                    .scaleEffect(self.show ? 1 : 0)
//                    .frame(width: self.show ? nil : 0, height: self.show ? nil : 0)
//            }
        }
        .sheet(isPresented: $show) {
            ExpandView(data: self.obs.users[self.obs.last == -1 ? self.obs.users.count - 1 : self.obs.last - 1], show: self.$show)
                               //shrinking the view in background...
                               .scaleEffect(self.show ? 1 : 0)
                               .frame(width: self.show ? nil : 0, height: self.show ? nil : 0)
        }

    }
}
