//
//  ContentView.swift
//  DatingAPP_POC
//
//  Created by Dustin yang on 6/25/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//

import SwiftUI
let screen2 = UIScreen.main

struct ContentView: View {
    @State var showLiked = false
    
    var body: some View {
        
        
        ZStack{
            
            Color("LightWhite").edgesIgnoringSafeArea(.all)
            
//            if obs.users.isEmpty{
//
//                Loader()
//            }
            
            VStack{
                
                TopView(show: $showLiked)
                
//                SwipeView()
                
                BottomView()
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




struct Home : View {
    
    @State var x : CGFloat = 0
    @State var count : CGFloat = 0
    @State var screen = UIScreen.main.bounds.width - 30
    @State var op : CGFloat = 0
    @State var selectedCard: Card?
    @State var bottomDragState: CGSize = .zero
    var heightBanner = (screen2.bounds.height * 0.65)
    @State var showFull = false
    @ObservedObject var viewModel : ShuffleViewModel = ShuffleViewModel()
    
    
    
    var body : some View{
        
        
        GeometryReader { proxy in
            ZStack {
                Ellipse().fill(Color(red: 78/255, green: 88/255, blue: 81/255))
                    .rotationEffect(.degrees(90))
                    .offset(y: -screen2.bounds.width * 0.7)
                    .edgesIgnoringSafeArea(.top)
                    .opacity(self.selectedCard == nil ? 1 : 0)
                
                
                VStack{
                    Spacer()
                    VStack(spacing: 20) {
                        Text("프로젝트  POC.. ")
                            .font(.system(size: 36, weight: .medium))
                        Text("Title")
                            .font(.system(size: 17))
                    }
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .padding(.top)
                    //                    Spacer()
                    
                    
                    HStack(spacing: 15){
                        ForEach(self.viewModel.listData){i in
                            
                            CardView(data: i)
                                .offset(x: self.x)
                                .onTapGesture {
                                    withAnimation(Animation.spring()) {
                                        self.selectedCard = i
                                        print(i)
                                    }
                            }
                            .highPriorityGesture(DragGesture()
                                
                            .onChanged({ (value) in
                                if value.translation.width > 0{
                                    
                                    self.x = value.location.x
                                }
                                else{
                                    
                                    self.x = value.location.x - self.screen
                                }
                                
                            })
                                .onEnded({ (value) in
                                    
                                    if value.translation.width > 0{
                                        
                                        
                                        if value.translation.width > ((self.screen - 80) / 2) && Int(self.count) != 0{
                                            
                                            
                                            self.count -= 1
                                            self.updateHeight(value: Int(self.count))
                                            self.x = -((self.screen + 15) * self.count)
                                        }
                                        else{
                                            
                                            self.x = -((self.screen + 15) * self.count)
                                        }
                                    }
                                    else{
                                        
                                        
                                        if -value.translation.width > ((self.screen - 80) / 2) && Int(self.count) !=  (self.viewModel.listData.count - 1){
                                            
                                            self.count += 1
                                            self.updateHeight(value: Int(self.count))
                                            self.x = -((self.screen + 15) * self.count)
                                        }
                                        else{
                                            
                                            self.x = -((self.screen + 15) * self.count)
                                        }
                                    }
                                })
                            )
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width)
                    .offset(x: self.op)
                    
                    
                    
                    Spacer()
                }            .background(Color.black.opacity(0.07).edgesIgnoringSafeArea(.bottom))
                    .animation(.spring())
                    .onAppear {
                        
                        self.op = ((self.screen + 15) * CGFloat(self.viewModel.listData.count / 2)) - (self.viewModel.listData.count % 2 == 0 ? ((self.screen + 15) / 2) : 0)
                        
                        self.viewModel.listData[0].show = true
                }
                .blur(radius: self.selectedCard == nil ? 0 : 50)
                ZStack {
                    Rectangle().fill(Color.clear)
                    if self.selectedCard?.img != nil {
                        Image(self.selectedCard!.img)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    }
                }
                .frame(width: screen2.bounds.width)
                .frame(height:screen2 == nil ? nil : self.heightBanner)
                .offset(y: self.selectedCard == nil ? -screen2.bounds.height : (self.heightBanner / 2) - (screen2.bounds.height / 2))
                .opacity(self.selectedCard == nil ? 0.5 : 1)
                .blur(radius: self.bottomDragState.height > 0 ? min(self.bottomDragState.height, 50) : 0)
                .animation(.easeInOut)
                
                BottomTray(selectedCard: self.selectedCard, isScrollDisabled: !self.showFull)
                    .frame(maxWidth: .infinity)
                    .frame(height: screen2.bounds.height * 0.7)
                    .padding(.top)
                    .padding(.bottom, 32)
                    .background(Color.white)
                    .cornerRadius(30)
                    .shadow(radius: 24)
                    .offset(y: self.selectedCard == nil ? screen2.bounds.height : screen2.bounds.height * 0.5)
                    .offset(y: self.bottomDragState.height)
                    .gesture(DragGesture().onChanged({ (value) in
                        self.bottomDragState = value.translation
                        
                        if self.showFull {
                            self.bottomDragState.height += -300
                        }
                        
                        if self.bottomDragState.height < -300 {
                            self.bottomDragState.height = -300
                        }
                        
                    }).onEnded({ (value) in
                        withAnimation(Animation.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0)) {
                            if self.bottomDragState.height > 100 {
                                self.selectedCard = nil
                                self.bottomDragState = .zero
                            }
                            
                            if self.bottomDragState.height < -200 || self.bottomDragState.height < -100 {
                                self.bottomDragState.height = -300
                                self.showFull = true
                            } else {
                                self.bottomDragState = .zero
                                self.showFull = false
                            }
                        }
                    }))
                
                
                
                
            }
            
        }.background(Color(red: 235/255, green: 235/255, blue: 227/255))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.top)
            .edgesIgnoringSafeArea(.bottom)
        
        
    }
    
    func updateHeight(value : Int){
        
        
        for i in 0..<self.viewModel.listData.count{
            
            self.viewModel.listData[i].show = false
        }
        
        self.viewModel.listData[value].show = true
    }
    
}


struct CardView : View {
    
    var data : Card
    
    var body : some View{
        
        VStack(alignment: .leading, spacing: 0){
            
            Image(data.img)
                .resizable()
            
            Text(data.name)
                .fontWeight(.bold)
                .padding(.vertical, 13)
                .padding(.leading)
            
        }
        .frame(width: UIScreen.main.bounds.width - 30, height: data.show ? 500 : 440)
        .background(Color.white)
        .cornerRadius(25)
    }
}

struct Card : Identifiable , Hashable{
    
    var id : Int
    var img : String
    var name : String
    var show : Bool
}

class ShuffleViewModel : ObservableObject {
    //    @Published var listData = ["one", "two", "three", "four"]
    
    @Published var listData = [
        
        Card(id: 0, img: "p1", name: "Jill", show: false),
        Card(id: 1, img: "p2", name: "Emma", show: false),
        Card(id: 2, img: "p3", name: "Catherine", show: false),
        Card(id: 3, img: "p4", name: "iJustine", show: false),
        Card(id: 4, img: "p5", name: "Juliana", show: false),
        Card(id: 5, img: "p6", name: "Lilly", show: false),
        Card(id: 6, img: "p7", name: "Emily", show: false)
        
    ]
    
    func shuffle() {
        listData.shuffle()
        //or listData = dictionary.shuffled().prefix(upTo: 10)
    }
}
