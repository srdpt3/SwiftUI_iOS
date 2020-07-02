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
    
    @Binding var data1 : Int
    @Binding var data2 : Int
    @Binding var data3 : Int
    @Binding var data4 : Int
    @Binding var data5 : Int
//
//      let data2 = Int.random(in: 0 ..< 100)
//      let data3 = Int.random(in: 0 ..< 100)
//      let data4 = Int.random(in: 0 ..< 100)
//      let data5 = Int.random(in: 0 ..< 100)
    
    func updateUIView(_ uiView: AAChartView, context: Context) {
        
    }
    
    func makeUIView(context: Context) -> AAChartView {
        let aaChartView = AAChartView()
//        let data1 = Int.random(in: 0 ..< 100)
//        let data2 = Int.random(in: 0 ..< 100)
//        let data3 = Int.random(in: 0 ..< 100)
//        let data4 = Int.random(in: 0 ..< 100)
//        let data5 = Int.random(in: 0 ..< 100)

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
            .title("")//The chart title
            .legendEnabled(false)
            .dataLabelsEnabled(true)
            //            .xAxisVisible(true)
            .animationType(.easeInBack)//图形渲染动画类型为"bounce"
            .colorsTheme(["#F78320", "#FDC20A", "#F78320", "#068E81", "#EA007B"])
            
            .markerRadius(0)
            .polar(true)
            .yAxisGridLineWidth(0)
            
            .categories(["잘생김","머리스타일 어울림","머리스타일 어울림","섹시", "족같음"])
            
            .series([
                AASeriesElement()
                    .data([data1,data2,data3,data4,data5]),
                //                                .data([9.0,9.0,9.0,9.0,9.0,9.0,]),
                //                                .data([6.0,6.0,6.0,6.0,6.0,6.0,]),
                //                            AASeriesElement()
                //                                .data([3.0,3.0,10.0,3.0,3.0,3.0,]),
            ])
            .yAxisMax(100)
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
