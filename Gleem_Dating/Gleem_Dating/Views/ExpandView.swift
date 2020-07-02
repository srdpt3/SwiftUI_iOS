//
//  ExpandView.swift
//  Gleem_Dating
//
//  Created by Dustin yang on 6/29/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct ExpandView: View {
    
    var data : datatype
    @Binding var show : Bool
    @Binding var isVoted: Bool
    @State var voted: Bool = false
    @State  var data1 = Int.random(in: 0 ..< 100)
    @State  var data2 = Int.random(in: 0 ..< 100)
    @State  var data3 = Int.random(in: 0 ..< 100)
    @State   var data4 = Int.random(in: 0 ..< 100)
    @State   var data5 = Int.random(in: 0 ..< 100)
    
    
    @State var buttonPressed = [false,false,false,false,false]
    let  buttonTitle = ["개족같이 생김","잘생김","섹시함","차도남","머리스타일 잘어울림","머리스타일 잘어울림","지적임","착해보임"]
    var selectedButton = [String]()
    
    @ObservedObject var uploadViewModel = UploadViewModel()

    //    @State var buttonSelected: Bool = false
    
    
    func persist() {
        uploadViewModel.persist(buttonPressed: buttonPressed, buttonTitle:buttonTitle)
    }
    
    func clean() {
        self.buttonPressed = [false]
        
        
    }
    
    
    var body: some View{
        
        VStack{
            
            // dismiss Button...
            ZStack(alignment: .topTrailing) {
                
                //                Image(self.data.image)
                //                    .resizable()
                //                    .cornerRadius(25)
                AnimatedImage(url: URL(string: self.data.image)).resizable().frame(width: (UIScreen.main.bounds.width ), height: (UIScreen.main.bounds.height )/1.9).aspectRatio(contentMode: ContentMode.fit)
                
                
                Button(action: {
                    
                    withAnimation{
                        self.show.toggle()
                    }
                    
                }) {
                    
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black.opacity(0.7))
                        .clipShape(Circle())
                }
                .padding(.trailing).padding(.top, 50)
                //                .padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top)! + 10)
            }
            .clipShape(CustomShape(corner: .bottomLeft, radii: 30))
            
            VStack(alignment: .leading, spacing: 5){
                
                HStack(spacing: 5){
                    Text(self.data.name)
                        .font(.callout)
                        .fontWeight(.bold)
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .padding(.leading,5)
                    
                    Text("5")
                        .foregroundColor(.gray)
                }
                
                
            }
            .padding(.horizontal,25)
            .foregroundColor(.black)
            //            .padding(.top)
            Divider()
            
            VStack{
                ScrollView(.vertical, showsIndicators: false){
                    
                    
                    if(self.voted == false){
                        VStack(spacing: 8){
                            HStack(spacing : 12){
                                AttrButtonView(isPressed: self.$buttonPressed[0],  title:buttonTitle[0])
                                //                        Spacer()
                                AttrButtonView(isPressed: self.$buttonPressed[1], title:buttonTitle[1])
                                AttrButtonView(isPressed: self.$buttonPressed[2], title:buttonTitle[2])
                                
                                
                            }.padding(.horizontal, 5)
                            //                    ChartView().frame(width: UIScreen.main.bounds.width, height: 300)
                            HStack(spacing : 12){
                                AttrButtonView(isPressed: self.$buttonPressed[3], title:buttonTitle[3])
                                //                        Spacer()
                                AttrButtonView(isPressed: self.$buttonPressed[4], title:buttonTitle[4])
                                
                            }.padding(.horizontal, 5)
                            
                            
                            Spacer()
                            Button(action:  {
                                // ACTION
                                self.voted.toggle()
                                self.isVoted.toggle()
                              
                                self.persist()
                                
                                //
                            }) {
                                Text("첫인상반영하고 결과보기".uppercased())
                                    .font(.system(.subheadline, design: .rounded))
                                    .fontWeight(.heavy)
                                    .padding(.horizontal, 50)
                                    .padding(.vertical, 10).foregroundColor( Color("Color2-1"))
                                    .background(
                                        Capsule().stroke( Color("Color2-1"), lineWidth: 2)
                                )
                                //                                                            .animation(
                                //                                                              Animation.easeInOut(duration: 1)
                                //                                                                  .delay(1)
                                //                                                          )
                            }
                            Spacer()
                        }.background(Color.clear)
                        
                    }else{
                        
                        
                        
                        ChartView(data1: self.$data1, data2: self.$data2, data3: self.$data3, data4: self.$data4, data5: self.$data5).frame(width: UIScreen.main.bounds.width / 1.2 , height: 280)  .padding(.top, -20)
                    }
                    
                    
                }
                //
                
            }
            
            
            Spacer(minLength: 0)
            
        }
        .background(Color.clear)
    }
}


//struct ButtonView : View{
//    var body: some View{
//
//    }
//}
