//
//  ContentView.swift
//  Gleem_Dating
//
//  Created by Dustin yang on 6/28/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//

import SwiftUI
let screen2 = UIScreen.main

struct ContentView: View {
    
    
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home : View {
    @State var index = 0
    @State var expand = false
    
    var body: some View {
        NavigationView{
            VStack(spacing: 0){
                
                HStack(spacing: 20){
                    Button(action: {

                    }){
                        Image("gleem_resized").resizable().frame(width: 120, height: 50)

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
                .padding().padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top).background(Color("Color-5"))
                
                
                
                ZStack(alignment: .bottom){
                    GeometryReader{_ in
                        VStack{
                            
                            if self.index == 0{
                                MainView()
                                
                            }
                            
                            
                            Text("")
                        }
                    }.background(Color.black.opacity(0.06))
                    
                    
                    ZStack(alignment: .top){
                        Circle().trim(from: 0.5, to: self.expand ? 1:0.5).fill(Color("Color-5")).frame(width: screen2.bounds.width, height: screen2.bounds.width)
                        
                        ZStack{
                            Button(action: {
                                
                            }){
                                VStack(spacing: 10){
                                    Image(systemName: "star").font(.title).foregroundColor(.white)
                                    Text("관심대상").fontWeight(.bold).foregroundColor(.white)
                                }
                            }.offset(x: -100, y:75)
                            
                            Button(action: {
                                
                            }){
                                VStack(spacing: 10){
                                    Image(systemName: "paperplane").font(.title).foregroundColor(.white)
                                    Text("채팅").fontWeight(.bold).foregroundColor(.white)
                                }
                            }.offset(y: 30)
                            
                            
                            Button(action: {
                                
                            }){
                                VStack(spacing: 10){
                                    Image(systemName: "square.and.arrow.up").font(.title).foregroundColor(.white)
                                    Text("공유").fontWeight(.bold).foregroundColor(.white)
                                }
                            }.offset(x: 100, y:75)
                        }.opacity(self.expand ? 1 : 0)
                    }.offset(y: screen2.bounds.width /  1.6)
                    
                    
                    
                    
                }.clipped()
                
                TabBar(index: self.$index, expand : self.$expand)
            }.edgesIgnoringSafeArea(.top)
        }
        
    }
}

class Host: UIHostingController<ContentView> {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}


struct TabBar : View {
    @Binding var index : Int
    @Binding var expand : Bool
    var body: some View {
        HStack{
            Button(action: {
                self.index = 0
                
            }){
                Image(systemName:"rectangle.stack.person.crop").resizable().frame(width: 25, height: 25)
                    .foregroundColor(self.index == 0 ? Color("Color-5"):Color.black.opacity(0.3))
            }
            
            
            Spacer(minLength:  0 )
            
            Button(action: {
                self.index = 1
                
            }){
                Image("add_pic").resizable().frame(width: 25, height: 25)
                    .foregroundColor(self.index == 1 ? Color("Color-5"):Color.black.opacity(0.3))
            }
            Spacer(minLength:  0 )
            
            
            Button(action: {
                
                withAnimation(Animation.default.speed(0.6)){
                    self.expand.toggle()
                }
                //                  self.index = 1
                
            }){
                //                Image(self.expand ? "xmark" : "29"   ).resizable().frame(width: 25, height: 25)
                Image(self.expand ? "cancel" : "50"   ).resizable().frame(width: 50, height: 50).cornerRadius(25).foregroundColor(Color("Color"))
                    .font(.title)
            }.offset(x: 0, y: -20).buttonStyle(PlainButtonStyle())
            Spacer(minLength:  0 )
            
            
            Button(action: {
                self.index = 2
                
            }){
                Image(systemName: "heart").resizable().frame(width: 25, height: 25)
                    .foregroundColor(self.index == 2 ? Color("Color-5"):Color.black.opacity(0.3))
            }
            Spacer(minLength:  0 )
            
            Button(action: {
                self.index = 3
            }){
                Image("settings").resizable().frame(width: 25, height: 25)
                    .foregroundColor(self.index == 3 ? Color("Color-5"):Color.black.opacity(0.3))
            }
        }
        .padding(.horizontal, 35)
        .padding(.top , 10)
        .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 5 : 0)
        .padding(.top, -10)
    }
}




struct MainView : View {
    @EnvironmentObject var obs : observer
    
    @State var showLiked = false
    var body: some View{
        NavigationView{

            ZStack{
                
                
                
                if obs.users.isEmpty{
                    
                    Loader()
                }
                
                VStack{
                    
                    //                TopView(show: $showLiked)
                    
                    SwipeView(users: self.obs.users)
                    
                   BottomView()
                }
                
            }.padding(.bottom, 20)
        }
        
    }
}

struct Home2 : View {
    
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
                
                //                BottomTray(selectedCard: self.selectedCard, isScrollDisabled: !self.showFull)
                //                    .frame(maxWidth: .infinity)
                //                    .frame(height: screen2.bounds.height * 0.7)
                //                    .padding(.top)
                //                    .padding(.bottom, 32)
                //                    .background(Color.white)
                //                    .cornerRadius(30)
                //                    .shadow(radius: 24)
                //                    .offset(y: self.selectedCard == nil ? screen2.bounds.height : screen2.bounds.height * 0.5)
                //                    .offset(y: self.bottomDragState.height)
                //                    .gesture(DragGesture().onChanged({ (value) in
                //                        self.bottomDragState = value.translation
                //
                //                        if self.showFull {
                //                            self.bottomDragState.height += -300
                //                        }
                //
                //                        if self.bottomDragState.height < -300 {
                //                            self.bottomDragState.height = -300
                //                        }
                //
                //                    }).onEnded({ (value) in
                //                        withAnimation(Animation.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0)) {
                //                            if self.bottomDragState.height > 100 {
                //                                self.selectedCard = nil
                //                                self.bottomDragState = .zero
                //                            }
                //
                //                            if self.bottomDragState.height < -200 || self.bottomDragState.height < -100 {
                //                                self.bottomDragState.height = -300
                //                                self.showFull = true
                //                            } else {
                //                                self.bottomDragState = .zero
                //                                self.showFull = false
                //                            }
                //                        }
                //                    }))
                
                
                
                
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
