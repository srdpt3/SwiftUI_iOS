//
//  HomeView.swift
//  TwitterClone
//
//  Created by Dustin yang on 5/14/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//

import SwiftUI

struct HomeView: View {
        @ObservedObject var observedData = getData()

        var body : some View{
            
            NavigationView{
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        VStack(alignment: .leading){
                            
                            ForEach(observedData.datas){i in
                                
                                tweetCellTop(name: i.name, id: i.tagId, pic: i.pic, image: i.url, msg: i.msg)
                                
                                if i.pic != ""{
                                    
                                    tweetCellMiddle(pic: i.pic).padding(.leading, 60)
                                    
                                }
                                

                                tweetCellBottom().offset(x: UIScreen.main.bounds.width / 4)
                            }
                        }
                        
                    }.padding(.bottom, 15)

                .navigationBarTitle("Home",displayMode: .inline)
                .navigationBarItems(leading:
                
                    Image("User Image").resizable().frame(width: 35, height: 35).clipShape(Circle()).onTapGesture {
                        
                        print("slide out menu ....")
                    }
                
                )
            }
        }
    }
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
