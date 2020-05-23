//
//  ContentView.swift
//  OnlineOrder
//
//  Created by Dustin yang on 5/22/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//

import SwiftUI
import Firebase

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct Home : View {
    
    @ObservedObject var categories = getCategoriesData()
    var body: some View {
        VStack {
            
            List(categories.datas){i in
                Text(i.name )
            }
        }
    }
}


class getCategoriesData : ObservableObject{
    
   @Published var datas = [category]()
    
    init() {
        
        let db = Firestore.firestore()
        
        db.collection("categories").addSnapshotListener { (snap, err) in
            
            if err != nil{
                
                print((err?.localizedDescription)!)
                return
            }
            
            for i in snap!.documentChanges{
                
                let id = i.document.documentID
                let name = i.document.get("name") as! String
                let price = i.document.get("price") as! String
                let pic = i.document.get("pic") as! String
                
               self.datas.append(category(id: id, name: name, price: price, pic: pic))
            }
        }
    }
}



