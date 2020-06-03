//
//  ContentView.swift
//  Hotel_Booking
//
//  Created by Dustin yang on 5/7/20.
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
    @State var show = false
    var body: some View {
        VStack(spacing: 15){
            
            HStack{
                VStack(alignment: .leading, spacing: 15){
                    Text("찾아보기").font(.largeTitle)
                    
                    Button(action: {
                        
                    }){
                        
                        HStack(spacing: 8){
                            Text("맛집 in 강남")
                            Image(systemName: "chevron.down").font(.body)
                        }
                        
                    }.foregroundColor(.black)
                    
                }
                
                Spacer()
                
                Button(action: {
                    
                }){
                    
                    Image("Menu").renderingMode(.original)
                    
                }
                
                
                
                
            }
            SearchView().padding(.vertical, 15)
            
            ScrollView(.vertical, showsIndicators:  false){
                VStack(spacing: 15) {
                    ForEach(datas){ i  in
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 15){
                                ForEach(i.row){j in
                                    VStack(alignment: .leading, spacing: 12){
                                        Image(j.image).resizable()
                                            .frame(width: 135, height: 160).onTapGesture {
                                              
                                        }
                                        Text(j.name).font(.caption).lineLimit(1)
                                        Text(j.rating).font(.caption)
                                        
                                    }.foregroundColor(Color.black.opacity(0.5)).frame(width: 135)
                                }
                            }
                        }
                    }
                }
            }
            
        }.padding(.horizontal, 15).sheet(isPresented: $show) {
            Detail()
        }
    }
}

struct SearchView : View {
    @State var txt = ""
    var body : some View {
        HStack(spacing: 15) {
            Image(systemName: "magnifyingglass").font(.body)
            TextField("맛집 찾아보기", text: $txt)
        }.padding().foregroundColor(.black).background(Color("Color")).cornerRadius(25)
    }
}

struct Detail: View {
    
    @State var selected = "23"
    
    var body : some View {
        
        VStack {
            Image("food7").resizable().aspectRatio(1, contentMode:.fit).frame(height: 350)
            
            VStack{
                
                VStack (spacing: 15) {
                    Text("이치에 서울특별시 강남구 선릉로155길 23-3 2F").foregroundColor(.black)
                    
                    HStack(spacing: 15) {
                        HStack{
                            Image(systemName: "star.fill").font(.caption)
                            Text("4.7")
                        }
                        
                        HStack{
                            Image("star")
                            Text("존맛탱")
                        }
                        
                        HStack{
                            Image("flame")
                            Text("핫플")
                        }
                    }
                    Divider().padding(.vertical,  15)
                    Text("아직도 기억나는 멘치카츠!!! 소스도 너무너무 맛있었고, 카츠도 두툼하고 적절하게 잘 익어서 소스랑 잘 어울렸어요. 다시 간다면 꼭 또 시킬 메뉴에요! 너무 맛있었음ㅠㅠ 카이센토마토니도 소스부터 시작해서 다 맛있어서, 조금씩 먹기에 감질맛났어요ㅎㅎㅎ 그 외에 나베, 카니 미소 등도 다 맛있음! 하나하나 맛있어서 만족스러웠어요ㅎㅎ").font(.caption)
                    
                }.padding().background(Color("Color")).foregroundColor(Color.black.opacity(0.5)).cornerRadius(25)
                
                HStack(spacing: 10){
                    ForEach(dates){i in
                        Button(action: {
                            self.selected = i.date
                        }){
                            VStack(spacing: 10){
                                Text(i.day)
                                Text(i.date)
                            }.padding()
                        }.foregroundColor(self.selected == i.date ?  Color.white: Color.gray)
                            .background( self.selected == i.date ?  Color.blue: Color.clear)
                        .cornerRadius(10)
     
                    }
                }.padding(.vertical, 15)

                Spacer()
                
                HStack{
                    Button(action: {
                        Text("인당 가격: 3만원")
                    }){
                        Text("예약").padding(.vertical, 15).padding(.horizontal, 35)
                    }.foregroundColor(.white).background(Color.blue).clipShape(Capsule()).padding(.top, 15)
                }
            }.padding(.horizontal,  25).padding(.top, -40)
            
        }
    }
}





struct type: Identifiable {
    var id : Int
    var row : [row]
}

struct row: Identifiable {
    var id : Int
    var name : String
    var rating: String
    var image : String
}

struct datatype: Identifiable {
    var id : Int
    var date: String
    var day: String
}


var datas=[type (id: 0, row: [
    row(id: 0, name: "쿠이신보", rating: "4.8", image: "food6"),
    row(id: 1, name: "이치에", rating: "4.7", image: "food7"),
    row(id: 2, name: "갓포아키", rating: "4.7", image: "food8")
]),
           type (id: 1, row: [
            row(id: 0, name: "파씨오네", rating: "4.7", image: "food9"),
            row(id: 1, name: "허브족발", rating: "4.7", image: "food10"),
            row(id: 2, name: "오향가", rating: "4.7", image: "food1")
           ]),
           type (id: 2, row: [
            row(id: 0, name: "알라프리마1", rating: "4.7", image: "food2"),
            row(id: 1, name: "농민백암왕순대", rating: "4.6", image: "food3"),
            row(id: 2, name: "마루심", rating: "4.6", image: "food4")
           ])]


var dates = [
datatype(id: 1, date: "07", day: "목"),
datatype(id: 2, date: "08", day: "금"),
datatype(id: 3, date: "09", day: "토"),
datatype(id: 4, date: "10", day: "일")]
