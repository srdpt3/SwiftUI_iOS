//
//  ContentView.swift
//  FleaMarketApp
//
//  Created by Dustin yang on 5/9/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView{
            VStack(spacing: 15){
                
                ZStack{
                    
                    Text("메종 마르지엘라 SS20").font(.subheadline).bold()
                    
                    HStack(spacing: 18){
                        
                        Button(action: {
                            
                        }) {
                            
                            Image("Menu").renderingMode(.original)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            
                            Image("search").renderingMode(.original)
                        }
                        
                        Button(action: {
                            
                        }) {
                            
                            Image("noti").renderingMode(.original)
                        }
                        
                        Button(action: {
                            
                        }) {
                            
                            Image("shop").renderingMode(.original)
                        }
                        
                    }
                }.background(Color.white)              .padding([.leading,.trailing,.top], 15)
                
                MainView()
                
                
            }.navigationBarBackButtonHidden(true).navigationBarTitle("").navigationBarHidden(true)
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MainView : View {
    @State var selected = "전체"

    var body: some View {
        VStack(spacing: 15){
            
            HStack{
                
                HStack{
                    
                    Button(action: {
                        
                    }) {
                        
                        HStack{
                            
                            Text("봄여름 신상")
                            
                            Spacer()
                            
                            Image("down")
                            
                        }.padding()
                        
                    }.foregroundColor(.black)
                        .background(Color.white)
                    
                    
                    Button(action: {
                        
                        
                    }) {
                        
                        Image("filter").renderingMode(.original).padding()
                        
                    }.background(Color.white)
                }
                
            }
            
            HStack{
                ForEach(types, id: \.self){i in
                    HStack{
                        Button(action: {
                            self.selected = i
                        }){
                            Text(i).padding()
                        }
                        .foregroundColor(self.selected == i ? .white: .black)
                        .background(self.selected == i ? Color.black:Color.white)
                    .cornerRadius(10)
                        
                    }
                    
                }
            }
            DetailScroll()
        }
    }
}

struct DetailScroll : View {
    
    @State var show = false
    
    var body : some View{
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing: 12){
                
                ForEach(datas){i in
                    
                    HStack{
                        
                        ForEach(i.rows){j in
                            
                            Cards(row: j)
                        }
                    }
                }
            }
        }
    }
}

struct Cards : View {
    
    var row : row
    @State var show  = false
    
    
    var body : some View{
        
        VStack(spacing: 8){
            
            NavigationLink(destination: DetailView(show: $show), isActive: $show){
                Image(row.image).renderingMode(.original).resizable().frame(width: UIScreen.main.bounds.width / 2 - 25, height: 240)
            }
            
            
            
            
            
            
            HStack{
                
                VStack(alignment: .leading, spacing: 10){
                    
                    Text(row.name)
                    Text(row.price).fontWeight(.heavy)
                    
                }.padding(.leading, 14)
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    
                    Image("option").renderingMode(.original)
                    
                }.padding(.trailing, 15)
            }
        }
    }
}


struct DetailView : View {
    @Binding var show : Bool
    @State var size = ""
    var body: some View {
        VStack{
            HStack(spacing: 18){
                
                Button(action: {
                    self.show.toggle()
                }) {
                    
                    Image("Back").renderingMode(.original)
                }
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    
                    Image("search").renderingMode(.original)
                }
                
                
                
                Button(action: {
                    
                }) {
                    
                    Image("shop").renderingMode(.original)
                }
                
            }.navigationBarTitle("")
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            Image("pic").resizable()
            
            VStack(spacing: 15){
                
                HStack{
                    VStack(alignment: .leading, spacing: 8){
                        Text("메종 마르지엘라").font(.title)
                        Text("$425.00").fontWeight(.heavy)
                    }
                    Spacer()
                    HStack(spacing: 10){
                        Circle().fill(Color.black).frame(width: 25, height: 25)
                            .border(Color.black, width: 4).cornerRadius(12)
                        Circle().fill(Color.white).frame(width: 25, height: 25).border(Color.black, width: 4).cornerRadius(12)
                        
                    }
                    
                }
                
                
                Text("WOMEN'S WHITE AIDS PRINT T-SHIRT - WHITE - ROUND NECK  - FRONT BLACK AIDS PRINT - SHORT SLEEVES - 100% COTTON- MADE IN ITALY").font(.caption).italic()
                
                Text("사이즈를 선택하세요")
                
                HStack{
                    
                    ForEach(sizes,id: \.self){i in
                        
                        Button(action: {
                            
                            self.size = i
                            
                        }) {
                            
                            Text(i).padding().border(Color.black, width: self.size == i ? 1.5 : 0)
                            
                        }.foregroundColor(.black)
                    }
                }
                
                
                HStack{
                    
                    Button(action: {
                        
                    }) {
                        
                        Text("카트에 담기").padding().border(Color.black, width: 1.4)
                        
                    }.foregroundColor(.black)
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }) {
                        
                        Text("바로 구매").padding()
                        
                    }.foregroundColor(.white)
                    .background(Color.black)
                    .cornerRadius(10)
                    
                }.padding([.leading,.trailing], 15)
                .padding(.top, 15).padding(.top, 1)
                
            }.padding()
            .background(rounded().fill(Color.white))
            .padding(.top, -50)
            
            
            
            
        }.padding().background(Color.white)
    }
}


struct rounded : Shape {
    
    func path(in rect: CGRect) -> Path {
    
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft,.topRight], cornerRadii: CGSize(width: 35, height: 35))
        
        return Path(path.cgPath)
    }
}

struct type : Identifiable{
    
    var id : Int
    var rows : [row]
}

struct row : Identifiable {
    
    var id : Int
    var name : String
    var price : String
    var image : String
    
}

var sizes = ["S","M","X","XL"]

var types = ["전체","드레스","T셔츠","신발"]

var datas = [
    
    
    type(id: 0,rows: [row(id:0,name: "White t-shirt", price: "$425", image: "p11-1"),row(id:1,name: "Flat", price: "$685", image: "pic2")]),
    
    type(id: 2,rows: [row(id:0,name: "NAVETTA DRESS", price: "$1090", image: "pic3"),row(id:1,name: "Off-white shirt", price: "$995", image: "pic4")]),
    
]
