//
//  ContentView.swift
//  DistanceEval
//
//  Created by Dustin yang on 5/9/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @State private var centerCoordinate = CLLocationCoordinate2D()
    @State private var locations = [MKPointAnnotation]()
    @State private var showSettings = false
    @ObservedObject var dm = DistanceManager()
    
    @ObservedObject var settings = SettingsManager()
    
    var body: some View {
        VStack {
            
            ZStack {
                MapView(ceterCoordinate: $centerCoordinate, mapAnnotations: locations).edgesIgnoringSafeArea(.all)
                Circle().fill(Color.blue).opacity(0.3).frame(width: 30, height: 30)
            }
            
            Button(action: {
                let newLocation = MKPointAnnotation()
                newLocation.coordinate = self.centerCoordinate
                self.locations.append(newLocation)
                
                
                if self.locations.count = = 2{
                    let locationA = CLLocation(latitude: (self.locations.first?.coordinate.latitude)!, longitude: (self.locations.first?.coordinate.longitude)!)
                    
                    let locationB = CLLocation(latitude: (self.locations.last?.coordinate.latitude)!, longitude: (self.locations.last?.coordinate.longitude)!)
                    
                    self.dm.distance([locationA,locationB])
                }else if self.locations.count > 2{
                    self.dm.distance = 0
                    self.locations.removeAll()
                    
                }
                
            }){
                if self.locations.count != 2{
                    Image(systemName: "plus")
                    
                }else{
                    Image(systemName: "trash")
                    
                }
                
            }.padding().background(Color.red).foregroundColor(.white)
                .font(.title).clipShape(Circle()).padding(.top , -35)
            
            Text("Distance Evaluation").font(.title)
            ZStack{
                RingView(percentage: (dm.distance ?? 0) / Double(settings.travelRadius) , startcolor: .red, endColor: .pink).aspectRatio(contentMode: .fit)
                //            Circle().frame(width: 300, height: 300)
                
                
                if dm.distance != 0 {
                    Text("\(Int(dm.distance ?? 0)) km").bold().font(.title)
                }
            }
            
            
            
            HStack{
                Spacer()
                Button(action: {
                    self.showSettings.toggle()
                }){
                    Image(systemName: "gear").sheet(isPresented:  $showSettings, content:  {
                        SettingsView()
                    })
                    
                }
                
                
            }.padding(.trailing, 20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
