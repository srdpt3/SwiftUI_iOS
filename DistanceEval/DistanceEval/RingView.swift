//
//  RingView.swift
//  DistanceEval
//
//  Created by Dustin yang on 5/10/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//

import SwiftUI

struct RingView: View {
    
    var percentage: Double
    var startcolor : Color
    var endColor : Color
    
    var body: some View {
        
        let gradient = AngularGradient(gradient: Gradient(colors:[startcolor, endColor]), center: .center, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 360))
        
        return ZStack{
            RingBackGroundShape()
            RingShape(currentPercent: percentage).fill(gradient).rotationEffect(.init(degrees: -90)).shadow(radius: 2).drawingGroup().animation(.easeOut)
        }
    }
}

struct RingShape : Shape {
    
    var currentPercent : Double
    
    func path(in rect: CGRect) ->Path{
        let thickness : CGFloat = 50
        let center = CGPoint(x: rect.width / 2 , y: rect.height / 2)
        let radius = rect.width / 2 - thickness
        
        var path = Path()
        path.addArc(center: center, radius: radius, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 360 * currentPercent), clockwise: false)
        
        return path.strokedPath(.init(lineWidth: thickness, lineCap: .round, lineJoin: .round))
    }
    
    var animatableData : Double{
         get {return currentPercent}
         set { currentPercent = newValue}
     }
}

struct RingBackGroundShape : Shape {
    func path(in rect: CGRect) ->Path{
        let thickness : CGFloat = 50
        let center = CGPoint(x: rect.width / 2 , y: rect.height / 2)
        let radius = rect.width / 2 - thickness
        
        var path = Path()
        path.addArc(center: center, radius: radius, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 360), clockwise: false)
        
        return path.strokedPath(.init(lineWidth: thickness, lineCap: .round, lineJoin: .round))
    }
    
 
}



struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView(percentage: 0.5, startcolor: .red, endColor: .pink)
    }
}
