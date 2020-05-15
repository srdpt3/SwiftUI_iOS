//
//  ContentView.swift
//  TwitterClone
//
//  Created by Dustin yang on 5/12/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var show = false

    var body: some View {

        ZStack{
            TabView{
                
                HomeView().tabItem {
                    
                    Image("Home")
                    
                }.tag(0)
                
                Text("Search").tabItem {
                    
                    Image("Search")
                    
                }.tag(1)
                
                Text("Notifications").tabItem {
                    
                    Image("Notifications")
                    
                }.tag(2)
                
                Text("Messages").tabItem {
                    
                    Image("Messages")
                    
                }.tag(3)
            }.accentColor(.blue)
            
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    Button(action: {
                        
                        self.show.toggle()
                        
                    }) {
                        
                        Image("Tweet").resizable().frame(width: 20, height: 20).padding()
                    }.background(Color("bg"))
                        .foregroundColor(.white)
                        .clipShape(Circle())
                    
                }.padding()
            }.padding(.bottom, 65)
            
        }.sheet(isPresented: $show){
            CreateTweet(show: self.$show)
        }
        
        
    }
}
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
}
