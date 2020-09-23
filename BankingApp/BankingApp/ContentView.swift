//
//  ContentView.swift
//  BankingApp
//
//  Created by Dustin yang on 9/21/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}
struct TopBarView : View {
    var body: some View{
        HStack{
            
        }
    }
}

struct CardView : View {
    var body: some View{
        HStack{
            
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

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
