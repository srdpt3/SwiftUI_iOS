//
//  ContentView.swift
//  HotelApp
//
//  Created by Dustin yang on 5/18/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
          TabView{
                  
                  Home().tabItem {
                      
                      Image("home")
                  }
                  
                  Text("Search").tabItem {
                      
                      Image("search")
                  }
                  
                  Text("Person").tabItem {
                      
                      Image("person")
                  }
                  
                  Text("Menu").tabItem {
                      
                      Image("menu")
                  }
                  
              }.accentColor(.white)
              .preferredColorScheme(.dark)
              .edgesIgnoringSafeArea(.top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct Home : View {
    
    var body : some View{
        
        VStack(spacing: 15){
            
            HStack{
                
                Text("$89")
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    
                    Image("Cart")
                }
                
            }.overlay(Image("hotel").resizable().frame(width: 40, height: 28))
            
            ScrollView(.vertical, showsIndicators: false) {

                topView().padding(.vertical,15)
                middleView()
                bottomView().padding(.top, 15)
            }
  
        }.padding()
    }
}


struct topView : View {
    
    @State var show = false
    @State var index : Int = 0;
    var body : some View{
        
        VStack(alignment: .leading, spacing: 15){
            
            Text("VIP 호텔").font(.title)
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack(spacing: 15){
                    
                        ForEach(top.indices, id: \.self) { index in
                            
                        Image(top[index]).resizable().frame(width: 320, height: 168).onTapGesture {
                            self.index = index
                            self.show.toggle()
                        }
 
                    }
                }
                
            }.padding(.top,15)
            
        }.sheet(isPresented: $show) {
            
            Detail(index: self.$index)
        }
    }
}

struct middleView : View {
    
    var body : some View{
        
        VStack(alignment: .leading, spacing: 15){
            HStack{
                Text("멤버쉽 10% 할인호텔").font(.body)
                         
                         ScrollView(.horizontal, showsIndicators: false) {
                             
                             HStack(spacing: 15){
                                 
                                 ForEach(middle,id: \.self){i in
                                     
                                                             Image(i).resizable().frame(width: 150, height: 160)

                                 }
                             }
                             
                         }.padding(.top,15)
            }
            
         
        }
    }
}

struct bottomView : View {
    var body : some View{
        
        VStack(alignment: .leading, spacing: 15){
            
            Text("추천 호텔").font(.title)
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack(spacing: 15){
                    
                    ForEach(bottom,id: \.self){i in
                        
                        Image(i).resizable().frame(width: 150, height: 160)
                    }
                }
                
            }.padding(.top,15)
        }
    }
}


struct Detail : View {
    @Binding var index: Int

    @State var selected = "소개"
    
    var body : some View{
        
        VStack(spacing : 0) {
            Image("Card1").resizable().frame(width: 422, height: 223)
            
            ZStack{
                
                VStack(spacing: 20){
                    
                    HStack(spacing: 25){
                        
                        Button(action: {
                            
                            self.selected = "소개"
                            
                        }) {
                            
                            Text("About").padding(.vertical,15).padding(.horizontal, 22)
                            
                        }.background(self.selected == "About" ? Color("Color") : Color.clear)
                        .foregroundColor(self.selected == "About" ? .white : Color.gray)
                        .cornerRadius(15)
                        
                        Button(action: {
                            
                            self.selected = "미디어"
                            
                        }) {
                            
                            Text("Media").padding(.vertical,15).padding(.horizontal, 22)
                            
                        }.background(self.selected == "Media" ? Color("Color") : Color.clear)
                        .foregroundColor(self.selected == "Media" ? .white : Color.gray)
                        .cornerRadius(15)
                        
                    }.padding(.top, 15)
                    
                    if self.selected == "소개"{
                        
                        About()
                    }
                    
                    else{
                        
                        Media()
                    }
                }
                
            }.background(Rounded().fill(Color.black))
            .padding(.top, -15)
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct About : View {
    
    var body : some View{
        
        VStack(alignment: .leading, spacing: 15){
            
            Text("시그니엘 서울, 국내 최고층 건물인 롯데월드타워 76층~101층에 위치한 시그니엘서울은 한국의 아름다움을 현대적인 감각으로 풀어낸 객실(235실)에서 서울의 파노라믹한 스카이라인과 환상적인 야경을 조망할 수 있으며 일몰과 일출을 한 자리에서 감상할 수 있는 국내 유일의 호텔입니다.").padding(.vertical, 15)
            
         
            
            HStack{
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    
                    Text("다양한 부대시설 >")
                }
            }
            
            Text("객실 알아보기").padding(.vertical, 15)
            
            Button(action: {
                
            }) {
                
                HStack(spacing: 10){
                    
                    Image("max")
                    
                    Text("그랜드 디럭스")
                }
            }
            
            Button(action: {
                
            }) {
                
                HStack(spacing: 10){
                    
                    Image("max")
                    
                    Text("프리미어")
                }
                
            }.padding(.top, 10)
            
            Button(action: {
                
            }) {
                
                HStack(spacing: 10){
                    
                    Image("max")
                    
                    Text("시그니엘 프리미어")
                }
                
            }.padding(.top, 10)
            
            Spacer()
            
        }.padding(.horizontal,25)
        .foregroundColor(Color.white.opacity(0.6))
    }
}

struct Media : View {
    
    var body : some View{
        
        VStack(alignment: .leading, spacing: 15){
            
            Text("사진").padding(.leading, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack(spacing: 15){
                    
                    ForEach(detail,id: \.self){i in
                        
                        Image(i).resizable().frame(width: 216, height: 121)
                    }
                }
                
            }.padding(.top,15)
            
            Text("영상").padding(.leading, 5)
            
            ZStack{
                
                Image("d3").resizable().frame(width: 216, height: 121)
                
                Button(action: {
                    
                }) {
                    
                    Image(systemName: "play.circle.fill").font(.largeTitle)
                    
                }.foregroundColor(.white)
                
            }.padding(.top, 15)
            
            Spacer()
            
        }.padding(.horizontal, 25)
        .foregroundColor(Color.white.opacity(0.6))
    }
}


struct Rounded : Shape {
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft,.topRight], cornerRadii: CGSize(width: 25, height: 25))
        
        return Path(path.cgPath)
    }
}

// sample data.....

var top = ["Card1","Card2"]
var middle = ["m1","m2","m3"]
var bottom = ["b1","b2","b3"]
var detail = ["d1","d2"]

