//
//  SettingsView.swift
//  DistanceEval
//
//  Created by Dustin yang on 5/10/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    
//    @State var travelRadius: Double  = 300
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @ObservedObject var settings = SettingsManager()
    
    var body: some View {
        VStack {
            ZStack{
                RoundedRectangle(cornerRadius: 20).fill(LinearGradient(gradient: Gradient(colors: [.red, .pink]), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 0, y: 1))).frame(width: 100, height: 100)
                Image(systemName: "map").foregroundColor(.white).font(.largeTitle)
            }.padding(.top, 150)
            
            
            Text("Your Ride Experience").font(.title).bold()
            Spacer().frame(height: 100)
            Text("How far do u want to like to drive?").bold()
            
            Slider(value: $settings.travelRadius, in:100...500, step:100)
            HStack{
                
                ForEach(0..<Int(settings.travelRadius / 100), id: \.self){ _ in
                    Image(systemName: "car").font((.largeTitle))

                }
           
            }.padding(.top, 10)
            Text("My radius is \(Int(settings.travelRadius)) Km").font(.headline).foregroundColor(.gray)
            Spacer()
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }, label: {Text("Done").bold()})

        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
