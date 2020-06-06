//
//  ContentView.swift
//  SwiftUIMovieDb
//
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabView {
            
            MovieListView()
                .tabItem {
                    VStack {
                        Image(systemName: "tv")
                        Text("영화")
                    }
            }
            .tag(0)
            
            MovieSearchView()
                .tabItem {
                    VStack {
                        Image(systemName: "magnifyingglass")
                        Text("검색")
                    }
            }
            .tag(1)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
