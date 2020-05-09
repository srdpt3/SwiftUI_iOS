//
//  ContentView.swift
//  Grocery_Shopping
//
//  Created by Dustin yang on 5/8/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var selected = "홈"
    var body: some View {
           
           NavigationView{
               
               
               VStack{
                   
                   if self.selected == "홈"{
                       
                       Home()
                   }
                   else if self.selected == "위시리스트"{
                       
                       GeometryReader{_ in
                           
                           Text("위시리스트")
                       }
                   }
                   else{
                       
                       GeometryReader{_ in
                           
                           Text("Cart")
                       }
                   }
                   
                   CustomTabView(selected: $selected)
               }
               .navigationBarTitle("")
               .navigationBarHidden(true)
               .navigationBarBackButtonHidden(true)
               
           }
       }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CustomTabView : View {
    
    @Binding var selected : String
    
    var body : some View{
        
        HStack{
            
            ForEach(tabs,id: \.self){i in
                
                VStack(spacing: 10){
                    
                    Capsule()
                        .fill(Color.clear)
                        .frame(height: 5)
                        .overlay(
                            
                            Capsule().fill(self.selected == i ? Color("Color") : Color.clear).frame(width: 55, height: 5)
                    )
                    
                    Button(action: {
                        
                        self.selected = i
                        
                    }) {
                        
                        VStack{
                            
                            Image(i).renderingMode(.original)
                            Text(i).foregroundColor(.black)
                        }
                    }
                }
            }
            
        }.padding(.horizontal)
    }
}

struct Home : View {
    
    @State var txt = ""
    
    var body : some View{
        
        VStack(spacing: 15){
            
            HStack(spacing: 12){
                
                Image(systemName: "person").renderingMode(.original).resizable().frame(width: 30, height: 30)
                
                Text("안녕하세요, Dustin 님 ").font(.body)
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    
                    Image("filter").renderingMode(.original)
                }
            }
            
            HStack(spacing: 15){
                HStack{
                    Image(systemName: "magnifyingglass").font(.body)
                    TextField("검색해주세요", text: $txt)
                }.padding(10).background(Color("Color1")).cornerRadius(20)
                
                Button(action: {
                    
                }) {
                    
                    Image("mic").renderingMode(.original)
                }
            }
            ScrollView(.vertical, showsIndicators: false){
                VStack(spacing:15){
                    Image("top").resizable().overlay(
                    
                        VStack{
                            Spacer()

                            HStack{
                                Text("씨부레 이걸 지금봣네 25% 세일").font(.headline).foregroundColor(.white)
                                Spacer()

                            }.padding()
                        }
                    
                    )
                    
                    
                    HStack{
                        Text("카테고리").font(.title)
                        Spacer()

                        Button(action: {
                            
                        }) {
                            
                              Text("더보기")
                        }.foregroundColor(Color("Color"))
                        
                    }.padding(.vertical, 15)
                    ScrollView(.horizontal, showsIndicators:  false){
                        HStack(spacing: 15) {
                            ForEach(categories, id: \.self){i in
                                VStack{
                                    Image(i).renderingMode(.original)
                                    Text(i)
                                }

                            }
                        }
                    }
                    
                    HomeBottomView()
                }
            }
            
            Spacer()
        }.padding(.horizontal)
    }
}


struct HomeBottomView : View {
    
    var body : some View{
        
        VStack(spacing: 15){
            
            HStack{

                Text("신선한 아이템").font(.title)
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    
                    Text("더보기")
                    
                }.foregroundColor(Color("Color"))
                
            }.padding(.vertical, 15)
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack(spacing: 15){
                    
                    ForEach(freshitems){i in
                        
                        FreshCellView(data: i)
                    }
                }
            }
            
            HStack{

                Text("레시피").font(.title)
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    
                    Text("더보기")
                    
                }.foregroundColor(Color("Color"))
                
            }.padding(.vertical, 15)
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack(spacing: 15){
                    
                    ForEach(recipeitems){i in
                        
                        RecipeCellView(data: i)
                    }
                }
            }
        }
    }
}

struct FreshCellView : View {
    
    var data : fresh
    @State var show = false
    
    var body : some View{
        
        ZStack{
            
            NavigationLink(destination: Detail(show: self.$show), isActive: self.$show) {
                
                Text("")
            }
            
            VStack(spacing: 10){
                
                Image(data.image).resizable().frame(width: 150, height: 150)
                Text(data.name).fontWeight(.semibold)
                Text(data.price).foregroundColor(.green).fontWeight(.semibold)
                
            }.onTapGesture {
                
                self.show.toggle()
            }
            
        }
    }
}

struct RecipeCellView : View {
    
    var data : recipe
    
    var body : some View{
        
        VStack(spacing: 10){
            
            Image(data.image)
            
            HStack(spacing: 10){
                
                Image(data.authorpic)
                
                VStack(alignment: .leading, spacing: 6){
                    
                    Text(data.name).fontWeight(.semibold)
                    Text(data.author).foregroundColor(.green).fontWeight(.semibold)
                }
            }

        }
    }
}

struct Detail : View {
    
    @Binding var show : Bool
    @State var top = UIApplication.shared.windows.last?.safeAreaInsets.top
    @State var count = 0
    
    var body : some View{
        
        VStack(spacing: 0){
            
            Image("header")
                .resizable()
                .frame(height: UIScreen.main.bounds.height / 2.5)
                .edgesIgnoringSafeArea(.top)
                .overlay(
            
                    VStack{
                        
                        HStack(spacing: 12){
                            
                            Button(action: {
                                
                                self.show.toggle()
                                
                            }) {
                                
                                Image("back").renderingMode(.original)
                            }
                            
                            Spacer()
                            
                            Button(action: {
                                
                            }) {
                                
                                Image("download").renderingMode(.original)
                            }
                            
                            Button(action: {
                                
                            }) {
                                
                                Image("Wishlist").renderingMode(.original)
                            }
                            
                        }.padding()
                        
                        Spacer()
                    }
            
                )
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(alignment: .leading,spacing: 15){
                    
                    Text("CJ 비비고 왕교자").font(.title)
                    
                    Text("6500원/ 팩").foregroundColor(.green)
                    
                    Divider().padding(.vertical, 15)
                    
                    HStack{
                        
                        Image("rp1").renderingMode(.original)
                        
                        Text("CJ 제일제당")
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            
                            Image("chat").renderingMode(.original)
                        }
                    }
                    
                    Text("#bibigo #비비고한섬만두 #박서준 #만두 #비비고만두 #한식 #한식의자존심 #K_food").foregroundColor(.gray)
                    
                    HStack{
                        
                        Text("Reviews (48)")
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            
                            Text("더보기")
                            
                        }.foregroundColor(Color("Color"))
                        
                    }.padding(.vertical, 10)
                    
                    HStack{
                        
                        Image("rp2").renderingMode(.original)
                        
                        VStack(alignment: .leading, spacing: 6){
                            
                           HStack{
                                
                                Text("4")
                                Image(systemName: "star.fill").foregroundColor(.yellow)
                                
                            }
                            
                            Text("조이서")
                            Text("개맛잇음.... 인정.")
                        }
                        
                    }.padding()
                    .background(Color("Color1"))
                    .cornerRadius(12)
                    
                    HStack(spacing: 20){
                        
                        Spacer(minLength: 12)
                        
                        Button(action: {
                            
                            self.count += 1
                        }) {
                            
                            Image(systemName: "plus.circle").font(.largeTitle)
                            
                        }.foregroundColor(.green)
                        
                        Text("\(self.count)")
                        
                        Button(action: {
                            
                            if self.count != 0{
                                
                                self.count -= 1
                            }
                            
                        }) {
                            
                            Image(systemName: "minus.circle").font(.largeTitle)
                            
                        }.foregroundColor(.green)
                        
                        Button(action: {
                            
                        }) {
                            
                            Text("담기").padding()
                            
                        }.foregroundColor(.white)
                        .background(Color("Color"))
                        .cornerRadius(12)
                        
                        Spacer(minLength: 12)
                    }
                }
                
            }.padding()
            .overlay(
            
            
                VStack{
                    
                    HStack{
                        
                        Spacer()
                        
                        HStack{
                            
                            Text("4").foregroundColor(.white)
                            Image(systemName: "star.fill").foregroundColor(.yellow)
                            
                        }.padding()
                        .background(Color.green)
                        .cornerRadius(12)
                    }
                    .padding(.top,-20)
                    .padding(.trailing)
                        
                    
                    Spacer()
                }
            
            )
            .background(RoundedCorner().fill(Color.white))
            .padding(.top, -top! - 25)
                
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct RoundedCorner : Shape {
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft,.topRight], cornerRadii: CGSize(width: 35, height: 35))
        
        return Path(path.cgPath)
    }
}

// sample datas...

var tabs = ["홈","위시리스트","장바구니"]

var categories = ["과일","야채","음료","생선","빵"]

struct fresh : Identifiable {
    
    var id : Int
    var name : String
    var price : String
    var image : String
}

struct recipe : Identifiable {
    
    var id : Int
    var name : String
    var author : String
    var image : String
    var authorpic : String
}

var freshitems = [
    fresh(id: 1, name: "비비고만두", price: "6500원/ 팩",image: "f2"),
    fresh(id: 0, name: "김말이", price: "5000원/ 팩",image: "f1"),
    fresh(id: 2, name: "커피브레드", price: "3500원 / 팩",image: "f3")


]

var recipeitems = [
    recipe(id: 0, name: "파스타", author: "데니조",image: "r1",authorpic: "rp1"),
    recipe(id: 1, name: "바나나 라이스", author: "흑자",image: "r2",authorpic: "rp2"),
    recipe(id: 2, name: "라면", author: "null",image: "r3",authorpic: "rp3")
]
