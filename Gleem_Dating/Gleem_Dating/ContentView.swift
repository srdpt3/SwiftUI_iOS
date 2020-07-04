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
                
                
                ZStack(alignment: .bottom){
                    GeometryReader{_ in
                        VStack{
                            
                            if self.index == 0{
                                MainView()
                                
                            }else if self.index == 1{
                                Color.blue
                                
                            }else if self.index == 2{
                                MyStaticView()
                                
                                
                            }else if self.index == 3{
                                SettingsView()
                            }
                            
                        }
                    }
//                    .background(Color.black.opacity(0.06))
                    
                    
                    ZStack(alignment: .top){
                        Circle().trim(from: 0.5, to: self.expand ? 1:0.5).fill(Color("Color-5")).frame(width: screen2.bounds.width, height: screen2.bounds.width)
                        
                        ZStack{
                            Button(action: {
                                
                            }){
                                VStack(spacing: 10){
                                    Image(systemName: "star").font(.title).foregroundColor(.white)
                                    Text("관심대상").foregroundColor(.white)
                                }
                            }.offset(x: -100, y:75)
                            
                            Button(action: {
                                
                            }){
                                VStack(spacing: 10){
                                    Image(systemName: "paperplane").font(.title).foregroundColor(.white)
                                    Text("채팅").foregroundColor(.white)
                                }
                            }.offset(y: 30)
                            
                            
                            Button(action: {
                                
                            }){
                                VStack(spacing: 10){
                                    Image(systemName: "square.and.arrow.up").font(.title).foregroundColor(.white)
                                    Text("공유").foregroundColor(.white)
                                }
                            }.offset(x: 100, y:75)
                        }.opacity(self.expand ? 1 : 0)
                    }.offset(y: screen2.bounds.width /  1.6)
                    
                    
                    
                    
                }.clipped()
                
                TabBar(index: self.$index, expand : self.$expand)
            }
            .edgesIgnoringSafeArea(.top)
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
        .background(Color.black.opacity(0.06).edgesIgnoringSafeArea(.bottom))
    }
}




struct MainView : View {
    @EnvironmentObject var obs : observer
    
    @State var showLiked = false
    var body: some View{
        
        ZStack{
            
            
            
            if obs.users.isEmpty{
                
                Loader()
                
            }
            
            VStack{
                
                TopView(show: $showLiked).padding(.bottom, -10)
                
                SwipeView(users: self.obs.users).padding(.bottom, 10).padding(.top, 20)
                
                BottomView().listRowInsets(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
            }
            
        }.padding(.bottom, 5)
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
