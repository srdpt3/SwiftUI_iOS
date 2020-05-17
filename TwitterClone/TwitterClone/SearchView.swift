//
//  SearchView.swift
//  TwitterClone
//
//  Created by Dustin yang on 5/15/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject var datas : getData
//    @ObservedObject var observedData = getData()

    var body : some View{
        
        NavigationView{
            
            List(datas.top){i in
                
                SearchCell(tag: i.tag, tweets: i.tweets)
                
            }.navigationBarTitle("트렌드",displayMode: .inline)
                .navigationBarItems(leading:
                    
                    HStack{
                        
                        Image("Twitter").resizable().frame(width: 35, height: 35).clipShape(Circle()).onTapGesture {
                            
                            print("slide out menu ....")
                        }
                        
                        SearchBar().frame(width: UIScreen.main.bounds.width - 120)
                    }
                    
                    , trailing:
                    
                    Button(action: {
                        
                    }, label: {
                        
                        Image("Add").resizable().frame(width: 35, height: 25)
                        
                    }).foregroundColor(Color("bg"))
                    
            )
            
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

struct SearchBar : UIViewRepresentable {
    
    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        
        let search = UISearchBar()
        return search
    }
    
    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        
        
    }
}
struct SearchCell : View {
    
    var tag = ""
    var tweets = ""
    
    var body : some View{
        
        VStack(alignment : .leading,spacing : 5){
            
            Text(tag).fontWeight(.heavy)
            Text(tweets + " 트윗").fontWeight(.light)
        }
    }
}
