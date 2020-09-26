//
//  ContentView.swift
//  BankingApp
//
//  Created by Dustin yang on 9/21/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            VStack{
                TopBarView()
                CardView()
                MenuSelectionView()
                Spacer()

                RecentlyTradedView()
            }.padding(.horizontal)
            .padding(.top, 80)
        }.background(Color.background).edgesIgnoringSafeArea(.all)
      
        
    }
}
struct TopBarView : View {
    var body: some View{
        HStack(spacing: 20){
            Circle().frame(width: 50, height: 50)
            Spacer()
            ZStack{
                Circle().fill(Color.white).frame(width: 50, height: 50)
                Image(systemName: "bell")
            }
            ZStack{
                Circle().fill(Color.white).frame(width: 50, height: 50)
                Image(systemName: "ellipsis").rotationEffect(.degrees(90))
            }
            
        }
    }
}

struct CardView : View {
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 25.0).fill(Color.cardLinear).frame(height: 220)
            HStack(alignment: .top, spacing: 15){
               
                VStack(alignment: .leading, spacing: 15){
                    HStack{
                        Text("안녕하세요,두선님 \n남은 잔액은: ").font(.system(size: 20, weight: .bold))
                        Spacer()
                        
                        Text("P").font(.system(size: 30, weight: .heavy)).italic()

                        
                    }
                    Text("14억5천500 만원").font(.system(size: 20, weight: .heavy))
                    ZStack{
                        RoundedRectangle(cornerRadius: 15).frame( height: 50)
                        
                        HStack{
                            Text("트랜잭션 내역")
                            Spacer()
                            
                            Image(systemName: "chevron.down")

                            
                        }.foregroundColor(.black).padding(.horizontal)
                    }
                }.padding(.horizontal).foregroundColor(.white)
            }
        }

    }
}

struct MenuSelectionView : View {
    var body: some View{
        HStack{
            MenuItemView(imageName: "creditcard.fill", title: "결제")
            MenuItemView(imageName: "dollarsign.circle", title: "송금")

        }.frame(height: 150)
    }
}

struct MenuItemView : View {
    let imageName: String
    let title : String
    var body: some View{
        ZStack(alignment: .leading){
            RoundedRectangle(cornerRadius: 20).fill(Color.white).overlay(
                
                RoundedRectangle(cornerRadius: 20).stroke(lineWidth: 2.0)
                
            )
            VStack(alignment: .leading){
                ZStack{
                    Circle().fill(Color.purple).frame(width: 45, height: 45)
                    Image(systemName: imageName)
                }
                
                Text(title)
            }.padding(.horizontal)
        }
    }
}

struct RecentlyTradedView : View {
    var body: some View{
        HStack{
            
        }
    }
}

extension Color{
    static let background = Color.init(red: 1, green: 246/255, blue :1)
    static let cardStart = Color.init(red: 11/255, green: 19/255, blue :2/255)
    static let cardEnd = Color.init(red: 48/255, green: 53/255, blue :27/255)

    static let cardLinear = LinearGradient(gradient: Gradient(colors: [cardStart, cardEnd]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
