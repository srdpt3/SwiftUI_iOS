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
    
    var body: some View{
        
        VStack{
            
            // dismiss Button...
            
            ZStack(alignment: .topTrailing) {
                
//                Image(self.data.image)
//                    .resizable()
//                    .cornerRadius(25)
                AnimatedImage(url: URL(string: self.data.image)).resizable().frame(width: (UIScreen.main.bounds.width ), height: (UIScreen.main.bounds.height )/1.8).cornerRadius(20)

                           
                Button(action: {
                    
                    // dismissing the expand view...
                    print("asdfasd")

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
                .padding(.trailing)
                .padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top)! + 10)
            }
            Spacer(minLength: 0)
            VStack(alignment: .leading, spacing: 12){
                
                Text(self.data.name)
                    .font(.title)
                    .fontWeight(.bold)
                
                HStack(spacing: 12){
                    
                    Image(systemName: "mappin.circle.fill")
                        .font(.system(size: 25, weight: .bold))
                    
                    Text(self.data.age)
                        .foregroundColor(.gray)
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .padding(.leading,5)
                    
                    Text("5")
                        .foregroundColor(.gray)
                }
                
                                Text("sadfasdfasfasfasfasfdasfdasfasfdasdfasdfasdfasdfasdfasdfasdfasdfsafdasdfasd")
            }
            .padding(.horizontal,25)
            .padding(.bottom,20)
            .foregroundColor(.black)
            .padding(.top)
            
            HStack{
                
                HStack(spacing: 15){
                    
                    Text("$ 1 (3Days)")
                        .font(.title)
                        .fontWeight(.bold)
                    //
                    //                    Text("(3Days)")
                    //                        .font(.title)
                }
                .padding(.leading, 15)
                
                Spacer()
                
                //                    Button(action: {
                ////
                ////                    }) {
                ////
                ////                        Text("Book Now")
                ////                            .foregroundColor(.white)
                ////                            .font(.system(size: 22))
                ////                            .padding(.vertical, 25)
                ////                            .frame(width: UIScreen.main.bounds.width / 2.5)
                ////                            .background(Color("Color"))
                ////                            .clipShape(CShape())
                ////                    }
                //                }
            }
        }
    }
}
