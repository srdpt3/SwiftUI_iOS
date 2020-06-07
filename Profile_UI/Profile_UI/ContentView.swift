//
//  ContentView.swift
//  Profile_UI
//
//  Created by Dustin yang on 6/6/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//

import SwiftUI

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
    var body: some View {
        VStack {
            HStack(spacing: 15){
                Button(action: {
                    
                } ){
                    Image(systemName: "chevron.left").font(.system(size: 22)).foregroundColor(.black)
                }
                
                Text("프로필").font(.title)
                Spacer(minLength: 0)
                
                Button(action: {
                    
                }){
                    Text("Add").foregroundColor(.white).padding(.vertical, 10)
                        .padding(.horizontal, 25).background(Color("Color")).cornerRadius(10)
                }
                
            }.padding()
            
            HStack{
                VStack(spacing : 0){
                    Rectangle().fill(Color("Color")).frame(width: 80, height: 3)
                        .zIndex(1)
                    Image("pic").resizable().frame(width: 100, height: 100).cornerRadius(50).padding(.top, 6).padding(.bottom, 4).padding(.horizontal, 8).background(Color("Color1")).shadow(color: Color.black.opacity(0.1), radius: 5, x: 8, y: 8).shadow(color: Color.black.opacity(0.5), radius: 5, x: -8, y: -8)
                }
                
                
                VStack(alignment: .leading, spacing: 12){
                    
                    Text("DS Yang")
                        .font(.title)
                        .foregroundColor(Color.black.opacity(0.8))
                    
                    Text("Senior SW Enginner")
                        .foregroundColor(Color.black.opacity(0.7))
                        .padding(.top, 8)
                    
                    Text("srdpt3@gmail.com")
                        .foregroundColor(Color.black.opacity(0.7))
                }
                .padding(.leading, 20)
                
                Spacer(minLength: 0)
            }.padding(.horizontal, 20).padding(.top, 5)
            
            // Tab Items...
            
            HStack{
                
                Button(action: {
                    
                    self.index = 0
                    
                }) {
                    
                    Text("Experinces")
                        .foregroundColor(self.index == 0 ? Color.white : .gray)
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(self.index == 0 ? Color("Color") : Color.clear)
                        .cornerRadius(10)
                }
                
                Spacer(minLength: 0)
                
                Button(action: {
                    
                    self.index = 1
                    
                }) {
                    
                    Text("Skills")
                        .foregroundColor(self.index == 1 ? Color.white : .gray)
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(self.index == 1 ? Color("Color") : Color.clear)
                        .cornerRadius(10)
                }
                
                Spacer(minLength: 0)
                
                Button(action: {
                    
                    self.index = 2
                    
                }) {
                    
                    Text("Project")
                        .foregroundColor(self.index == 2 ? Color.white : .gray)
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(self.index == 2 ? Color("Color") : Color.clear)
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal,8)
            .padding(.vertical,5)
            .background(Color("Color1"))
            .cornerRadius(8)
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 8, y: 8)
            .shadow(color: Color.white.opacity(0.5), radius: 5, x: -8, y: -8)
            .padding(.horizontal)
            .padding(.top,10)
            
            
            // Cards...
            
            HStack(spacing: 20){
                
                VStack(spacing: 12){
                    
                    Image("blk")
                        .resizable()
                        .frame(width: 100, height: 80)
                    
                    Text("BlackRock")
                        .font(.title)
                        .padding(.top,10)
                    
                    Text("SW Developer")
                        .foregroundColor(Color("Color"))
                    
                    Text(" > 2 Years")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .padding(.vertical)
                    // half screen - spacing - two side paddings = 60
                    .frame(width: (UIScreen.main.bounds.width - 60) / 2)
                    .background(Color("Color1"))
                    .cornerRadius(15)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 8, y: 8)
                    .shadow(color: Color.white.opacity(0.5), radius: 5, x: -8, y: -8)
                // shadows...
                
                VStack(spacing: 12){
                    
                    Image("cboe")
                        .resizable()
                        .frame(width: 100, height: 80)
                    
                    Text("CBOE")
                        .font(.title)
                        .padding(.top,10)
                    
                    Text("SW Developer")
                        .foregroundColor(Color("Color"))
                    
                    Text("3 Years")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .padding(.vertical)
                    // half screen - spacing - two side paddings = 60
                    .frame(width: (UIScreen.main.bounds.width - 60) / 2)
                    .background(Color("Color1"))
                    .cornerRadius(15)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 8, y: 8)
                    .shadow(color: Color.white.opacity(0.5), radius: 5, x: -8, y: -8)
                // shadows...
                
            }
            .padding(.top,8)
            HStack(spacing: 20){
                
                VStack(spacing: 12){
                    
                    Image("asml")
                        .resizable()
                        .frame(width: 100, height: 80)
                    
                    Text("ASML")
                        .font(.title)
                        .padding(.top,10)
                    
                    Text("SW DEV")
                        .foregroundColor(Color("Color"))
                    
                    Text("3 Year")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .padding(.vertical)
                    // half screen - spacing - two side paddings = 60
                    .frame(width: (UIScreen.main.bounds.width - 60) / 2)
                    .background(Color("Color1"))
                    .cornerRadius(15)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 8, y: 8)
                    .shadow(color: Color.white.opacity(0.5), radius: 5, x: -8, y: -8)
                // shadows...
                
                VStack(spacing: 12){
                    
                    Image("tmax")
                        .resizable()
                        .frame(width: 100, height: 80)
                    
                    Text("TmaxSoft")
                        .font(.title)
                        .padding(.top,10)
                    
                    Text("SW Developer")
                        .foregroundColor(Color("Color"))
                    
                    Text("1 Year")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .padding(.vertical)
                    // half screen - spacing - two side paddings = 60
                    .frame(width: (UIScreen.main.bounds.width - 60) / 2)
                    .background(Color("Color1"))
                    .cornerRadius(15)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 8, y: 8)
                    .shadow(color: Color.white.opacity(0.5), radius: 5, x: -8, y: -8)
                // shadows...
                
            }
            .padding(.top,8)
            
            Spacer(minLength:  0)
        }.background(Color("Color1"))
    }
}
