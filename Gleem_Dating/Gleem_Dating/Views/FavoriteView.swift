//
//  FavoriteView.swift
//  Gleem_Dating
//
//  Created by Dustin yang on 7/6/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct FavoriteView: View {
    @ObservedObject private var favoriteViewModel = FavoriteViewModel()
    
    //    init() {
    //        self.favoriteViewModel.loadFavoriteUsers()
    //    }
    var body: some View {
        //        NavigationView {
        VStack   {
            //                GeometryReader{_ in
            VStack(spacing: 10){
                
                if !self.favoriteViewModel.favoriteUsers.isEmpty {
                    
                    MainSubViewFavorite(title: "Favorite Votes", users: self.favoriteViewModel.favoriteUsers)
                    
                    
                } else {
                    LoadingView(isLoading: self.favoriteViewModel.isLoading, error: self.favoriteViewModel.error) {
                        self.favoriteViewModel.loadFavoriteUsers()
                    }
                }
            }
            
            
            
            
        }
        .navigationBarHidden(true)
        .navigationBarTitle("").font(.caption).padding(.horizontal, 16)            .padding(.bottom, 45)
        .onAppear(){
            self.favoriteViewModel.loadFavoriteUsers()
        }
        
        
        
    }
}

struct MainSubViewFavorite: View{
    let title: String
    let users: [User]
    @State var show : Bool  = false
    @State var showExpandView : Bool = false
    @State var isVoted : Bool  = true
    //    var user : User?
    @State var selectedUser : User?

    var body : some View{
        
        ZStack{
            VStack(spacing: 0){
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 20){
                        ForEach(0..<users.chunked(3).count){index in
                            
                            HStack(spacing: 8){
                                ForEach(self.users.chunked(3)[index]){i in
                                    
                                    //                                NavigationLink(destination: ExpandView(user: i, show: self.$show, isVoted: self.$isVoted)) {
                                    
                                    FavoriteCard(user: i).onTapGesture {
                                        self.show.toggle()
                                        self.selectedUser = i
                                    }.opacity(self.show ? 0 : 1).animation(.default)
                                    
                                    
                                    
                                    
                                    
                                }
                            }.padding(.horizontal, 12)
                            
                        }
                    }
                    
                }
                
                
                
                
            }.padding()
            if(self.show){
                ExpandView(user: self.selectedUser!, show: self.$show, isVoted: self.$isVoted).padding(.top, 30)
            }
        }
        
        
        
        //        if(self.showExpandView){
        //            ExpandView(user: User.currentUser()!, show: self.$show, isVoted: self.$isVoted)
        //        }
        //
        
        
    }
}


struct FavoriteCard: View {
    let user: User
    
    var body: some View {
        VStack {
            AnimatedImage(url: URL(string:self.user.profileImageUrl))
                .resizable().frame(width: (UIScreen.main.bounds.width - 35) / 3, height: (UIScreen.main.bounds.height ) / 5).cornerRadius(15)
            HStack {
                
                Text(user.username).font(.footnote).lineLimit(1)
            }
            
            
            
            
        } .padding(.all, 8)
            .frame(width: (UIScreen.main.bounds.width - 25) / 3)
            .background(Color("Color-2"))
            .cornerRadius(15)
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 8, y: 8)
            .shadow(color: Color.white.opacity(0.5), radius: 5, x: -8, y: -8)
        
        
        
    }
    
}

//struct MovieUpComingView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieUpComingView()
//    }
//}
//

extension Array{
    func chunked(_ size: Int)->[[Element]]{
        stride(from: 0, to: count, by: size).map{
            Array(self[$0 ..< Swift.min($0+size, count)])
        }
    }
}
