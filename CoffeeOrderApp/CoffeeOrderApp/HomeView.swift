//
//  ContentView.swift
//  CoffeeOrderApp
//
//  Created by Dustin yang on 5/19/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var dataListener = DrinkListener()
    var categories: [String: [Drink]] {
        .init(grouping: dataListener.drinks, by: {$0.category.rawValue})
    }
    var body: some View {
        NavigationView {
            List(categories.keys.sorted(), id: \String.self){
                key in
                DrinkRow(categoryName: "\(key) Drink".uppercased(), drinks: self.categories[key]!).padding(.top).padding(.bottom)
            }
                
                .navigationBarTitle("Coffee App").navigationBarItems(leading:
                    
                    Button(action: {
                        
                    }, label: {
                        Text("Log Out")
                    })
                    
                    , trailing:
                    
                    Button(action: {
                    }, label: {
                        Image("basket")
                    })
            )
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}




