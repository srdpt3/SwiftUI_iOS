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
    
    var user : User
    @Binding var show : Bool
    @Binding var isVoted: Bool
    //    @State var voted: Bool = false
    @State var voteData:[Double] = []
    //    @State var voteData = [Int.random(in: 0 ..< 100),Int.random(in: 0 ..< 100),Int.random(in: 0 ..< 100),Int.random(in: 0 ..< 100),Int.random(in: 0 ..< 100)]
    
    @State var buttonPressed = [false,false,false,false,false]
    let  buttonTitle = ["개같이 생김","잘생김","섹시함","스마트함","머리스타일 잘어울림"]
    var selectedButton = [String]()
    
    @ObservedObject private var voteViewModel = VoteViewModel()
    @ObservedObject private var chartViewModel = ChartViewModel()
    @ObservedObject  private var favoriteViewModel = FavoriteViewModel()
    
    //    @State var buttonSelected: Bool = false

    
    func persist() {
        //                                     self.topRatedState.loadMovies(with: .topRated)
        self.voteViewModel.persist(id: user.id, buttonPressed: self.buttonPressed, buttonTitle:self.buttonTitle)
        self.loadChartData()
    }
    
    func loadChartData(){
        self.chartViewModel.loadChartData(userId: user.id) { (vote) in
            
            self.voteData.removeAll()
            
            
            self.voteData.append((Double(vote.attr1) / Double(vote.numVote) * 100).roundToDecimal(0))
            self.voteData.append((Double(vote.attr2) / Double(vote.numVote) * 100).roundToDecimal(0))
            self.voteData.append((Double(vote.attr3) / Double(vote.numVote) * 100).roundToDecimal(0))
            self.voteData.append((Double(vote.attr4) / Double(vote.numVote) * 100).roundToDecimal(0))
            self.voteData.append((Double(vote.attr5) / Double(vote.numVote) * 100).roundToDecimal(0))
            //            self.totalNum = vote.numVote
            
            print(self.voteData)
            
        }
    }
    
    func addToMyList(){
        if(User.currentUser() != nil){
            if(self.favoriteViewModel.liked){
                self.favoriteViewModel.removeFromList(id: user.id)
            }else{
                
                // Add to the list
                self.favoriteViewModel.addToMyList(user: user)
            }
            self.favoriteViewModel.liked.toggle()
            
        }
    }
    
    func checkAttrSelected() -> Bool{
        // Check any button is presssed
        for (index, button) in buttonPressed.enumerated() {
            if (button){
                return true;
            }
        }
        return false
    }
    
    
    var body: some View{
        
        VStack{
            
            // dismiss Button...
            ZStack(alignment: .topTrailing) {
                
                AnimatedImage(url: URL(string: self.user.profileImageUrl)).resizable().scaledToFit().frame(width: (UIScreen.main.bounds.width ), height: (UIScreen.main.bounds.height )/2.3)
                
                
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
                if(self.isVoted){
                    ZStack{
                        Button(action:addToMyList) {
                              
                              Image(self.favoriteViewModel.liked == true ? "heartred" : "heartwhite").resizable().frame(width: 50, height: 50).aspectRatio(contentMode: .fit)
                              //                        .renderingMode(.original)
                              //                        .padding()
                              
                              
                          }.buttonStyle(PlainButtonStyle())
                              .background(Color.clear).foregroundColor(.black)
                              .padding(.trailing).offset(y: (UIScreen.main.bounds.height )/2.7)
                              .animation( Animation.easeInOut(duration: 1) .delay(1))
                    }
  
                    
                }
                
                
                
                //                .padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top)! + 10)
            }
            .clipShape(CustomShape(corner: .bottomLeft, radii: 30))
            //            .background(Color.black.opacity(0.06).edgesIgnoringSafeArea(.top))
            
            VStack(alignment: .leading, spacing: 5){
                
                HStack(spacing: 5){
                    Text(self.user.username)
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
                    
                    
                    if(!self.isVoted){
                        VStack(spacing: 8){
                            HStack(spacing : 12){
                                AttrButtonView(isPressed: self.$buttonPressed[0],  title:buttonTitle[0])
                                //                        Spacer()
                                AttrButtonView(isPressed: self.$buttonPressed[1], title:buttonTitle[1])
                                AttrButtonView(isPressed: self.$buttonPressed[2], title:buttonTitle[2])
                                
                                
                            }.padding(.horizontal, 5)
                            HStack(spacing : 12){
                                AttrButtonView(isPressed: self.$buttonPressed[3], title:buttonTitle[3])
                                //                        Spacer()
                                AttrButtonView(isPressed: self.$buttonPressed[4], title:buttonTitle[4])
                                Spacer()
                                
                            }.padding(.horizontal, 20)
                            
                            
                            Spacer()
                            Button(action:  {
                                // ACTION
                                self.persist()
                                withAnimation{
                                    //                                    self.voted.toggle()
                                    self.isVoted.toggle()
                                    
                                }
                                
                            }) {
                                Text("첫인상반영하고 결과보기".uppercased())
                                    .font(.system(.subheadline, design: .rounded))
                                    .fontWeight(.heavy)
                                    .padding(.horizontal, 50)
                                    .padding(.vertical, 10).foregroundColor( Color("Color5"))
                                    .background(
                                        Capsule().stroke( Color("Color5"), lineWidth: 2)
                                )
                                //                                                            .animation(
                                //                                                              Animation.easeInOut(duration: 1)
                                //                                                                  .delay(1)
                                //                                                          )
                            }                    // Disabling button by verifying all images...
                                .opacity(self.checkAttrSelected() ? 1 : 0.35)
                                .disabled(self.checkAttrSelected() ? false : true).padding(.top, 10)
                            Spacer()
                        }.background(Color.clear)
                        
                    }else{
                        
                        if !self.voteData.isEmpty {
                            
                            ChartView(data: self.$voteData, totalNum: CHART_Y_AXIS, categories: self.buttonTitle).frame(width: UIScreen.main.bounds.width , height: (UIScreen.main.bounds.height )/2.6).padding().padding(.top, -20)
                            
                            
                        } else {
                            LoadingView(isLoading: self.chartViewModel.isLoading, error: self.chartViewModel.error) {
                                self.loadChartData()
                            }
                        }
                        
                        
                    }
                    //
                    
                }
                
                
                Spacer(minLength: 0)
                
            }
            .background(Color.clear)
            .onAppear{
                         self.loadChartData()
                self.favoriteViewModel.checkLiked(id: self.user.id)

            }
        }
    }
    
    
    //struct ButtonView : View{
    //    var body: some View{
    //
    //    }
    //}
}
