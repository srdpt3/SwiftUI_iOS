//
//  Loader.swift
//  Gleem_Dating
//
//  Created by Dustin yang on 6/29/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//

import SwiftUI


struct Loader : View {
    @State var animate = false
    var body: some View{
        VStack{
            Circle().trim(from: 0, to: 0.8).stroke(AngularGradient(gradient: .init(colors: [Color("Color1-2"), Color(
                "Color2")]), center: .center), style: StrokeStyle(lineWidth: 8, lineCap: .round)).frame(width: 40, height: 40).rotationEffect(.init(degrees: self.animate ? 360 : 0)).animation(Animation.linear(duration: 0.7 ).repeatForever(autoreverses: false)).padding(.top, 10)
            Text("Please Wait.....").padding(.all, 10).foregroundColor(Color("Color2"))
        }.background(Color.white).cornerRadius(20).onAppear(){
            self.animate.toggle()
        }
    }
}



struct Loader_Previews: PreviewProvider {
    static var previews: some View {
        
               GeometryReader{_ in
                   
                   Loader()
                   
               }.background(Color.black.opacity(0.3).edgesIgnoringSafeArea(.all))
         
        
//        Loader()
    }
}
