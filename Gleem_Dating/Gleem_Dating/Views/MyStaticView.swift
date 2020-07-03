//
//  MyStaticView.swift
//  Gleem_Dating
//
//  Created by Dustin yang on 7/3/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//

import SwiftUI

struct MyStaticView: View {
    var user : User
   
    @State var totalNum : Int = 0
    @State var voteData:[Double] = []
    //    @State var voteData = [Int.random(in: 0 ..< 100),Int.random(in: 0 ..< 100),Int.random(in: 0 ..< 100),Int.random(in: 0 ..< 100),Int.random(in: 0 ..< 100)]
    
    @State var buttonPressed = [false,false,false,false,false]
    let  buttonTitle = ["개족같이 생김","잘생김","섹시함","스마트함","머리스타일 잘어울림"]
    var selectedButton = [String]()
    
    @ObservedObject var chartViewModel = ChartViewModel()

    var body: some View {
        VStack{
                ChartView(data: self.$voteData, totalNum: self.$totalNum, categories: self.buttonTitle).frame(width: UIScreen.main.bounds.width / 1.2 , height: 280)  .padding(.top, -20)
        }.onAppear()
    }
}

//struct MyStaticView_Previews: PreviewProvider {
//    static var previews: some View {
//        MyStaticView()
//    }
//}
