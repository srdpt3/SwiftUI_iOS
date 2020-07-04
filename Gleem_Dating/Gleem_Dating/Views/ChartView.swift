//
//  ChartView.swift
//  Gleem_Dating
//
//  Created by Dustin yang on 6/28/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//

import SwiftUI
import AAInfographics

struct ChartView: UIViewRepresentable {
    
    @Binding var data : [Double]
    @Binding var totalNum : Int
    var categories : [String]
    let hexColor = "#627AFA"
    let aaChartView = AAChartView()
    let animationType : AAChartAnimationType = AAChartAnimationType.bouncePast
//Animation type
//    case linear
//    case easeInQuad
//    case easeOutQuad
//    case easeInOutQuad
//    case easeInCubic
//    case easeOutCubic
//    case easeInOutCubic
//    case easeInQuart
//    case easeOutQuart
//    case easeInOutQuart
//    case easeInQuint
//    case easeOutQuint
//    case easeInOutQuint
//    case easeInSine
//    case easeOutSine
//    case easeInOutSine
//    case easeInExpo
//    case easeOutExpo
//    case easeInOutExpo
//    case easeInCirc
//    case easeOutCirc
//    case easeInOutCirc
//    case easeOutBounce
//    case easeInBack
//    case easeOutBack
//    case easeInOutBack
//    case elastic
//    case swingFromTo
//    case swingFrom
//    case swingTo
//    case bounce
//    case bouncePast
//    case easeFromTo
//    case easeFrom
//    case easeTo
    func updateUIView(_ uiView: AAChartView, context:  UIViewRepresentableContext<Self>) {
        let aaChartModel = AAChartModel()
            .chartType(.area)
            .legendEnabled(false)
            .dataLabelsEnabled(true)
            .animationType(animationType)
      
                       .colorsTheme([hexColor])

            .title(SERIES_TITLE)

            .markerRadius(0)
            .polar(true)
            .yAxisGridLineWidth(0)
            .categories(categories)
            
            .series([
                AASeriesElement().name(SERIES_TITLE)
                    .data([data[0],data[1],data[2],data[3],data[4]]),
                //                                .data([9.0,9.0,9.0,9.0,9.0,9.0,]),
                //                                .data([6.0,6.0,6.0,6.0,6.0,6.0,]),
                //                            AASeriesElement()
                //                                .data([3.0,3.0,10.0,3.0,3.0,3.0,]),
            ])
            .yAxisMax(Float(totalNum))
            .yAxisVisible(false)
        uiView.aa_drawChartWithChartModel(aaChartModel)
    }
    
    func makeUIView(context: Context) -> AAChartView {
        
        //        let aaChartModel = AAChartModel()
        //            .chartType(.column)//Can be any of the chart types listed under `AAChartType`.
        //            .animationType(.bounce)
        //            .title("TITLE")//The chart title
        //            .subtitle("subtitle")//The chart subtitle
        //            .dataLabelsEnabled(false) //Enable or disable the data labels. Defaults to false
        //            .tooltipValueSuffix("USD")//the value suffix of the chart tooltip
        //            .categories(["Jan", "Feb", "Mar", "Apr", "May", "Jun",
        //                         "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"])
        //            .colorsTheme(["#fe117c","#ffc069","#06caf4","#7dffc0"])
        //            .series([
        //                AASeriesElement()
        //                    .name("Tokyo")
        //                    .data([7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]),
        //                AASeriesElement()
        //                    .name("New York")
        //                    .data([0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5]),
        //                AASeriesElement()
        //                    .name("Berlin")
        //                    .data([0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0]),
        //                AASeriesElement()
        //                    .name("London")
        //                    .data([3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]),
        //            ])
        //
        let aaChartModel = AAChartModel()
            .chartType(.area)
            .legendEnabled(false)
            .dataLabelsEnabled(true)
            //            .xAxisVisible(true)
            .animationType(animationType)
            .colorsTheme([hexColor])
            .title(SERIES_TITLE)
            
            .markerRadius(0)
            .polar(true)
            .yAxisGridLineWidth(0)
            .categories(categories)
            .series([
                AASeriesElement().name(SERIES_TITLE)
                    .data([data[0],data[1],data[2],data[3],data[4]]),
                
            ])
            .yAxisMax(Float(totalNum))
            .yAxisVisible(false)
        aaChartView.aa_drawChartWithChartModel(aaChartModel)
        return aaChartView
    }
}

//struct ChartView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChartView()
//    }
//}
