//
//  MovieListView.swift
//  SwiftUIMovieDB
//
//  Created by Dustin Yang on 22/05/20.
//

import SwiftUI

struct MovieListView: View {
    
    @ObservedObject private var nowPlayingState = MovieListState()
    @ObservedObject private var upcomingState = MovieListState()
    @ObservedObject private var topRatedState = MovieListState()
    @ObservedObject private var popularState = MovieListState()
    
    var body: some View {
        NavigationView {
            
            List {
                Group {
                    if nowPlayingState.movies != nil {
                        MoviePosterCarouselView(title: "현재상영중", movies: nowPlayingState.movies!)
                        
                    } else {
                        LoadingView(isLoading: self.nowPlayingState.isLoading, error: self.nowPlayingState.error) {
                            self.nowPlayingState.loadMovies(with: .nowPlaying)
                        }
                    }
                    
                }
                .listRowInsets(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
                
                Group {
                    if upcomingState.movies != nil {
                        MovieBackdropCarouselView(title: "상영예작", movies: upcomingState.movies!)
                    } else {
                        LoadingView(isLoading: self.upcomingState.isLoading, error: self.upcomingState.error) {
                            self.upcomingState.loadMovies(with: .upcoming)
                        }
                    }
                }
                .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                
                
                Group {
                    if topRatedState.movies != nil {
//                        MovieBackdropCarouselView(title: "평점 좋은영화들", movies: topRatedState.movies!)
                        ContentView2()
                        
                    } else {
                        LoadingView(isLoading: self.topRatedState.isLoading, error: self.topRatedState.error) {
                            self.topRatedState.loadMovies(with: .topRated)
                        }
                    }
                    
                    
                }
                .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                
                Group {
                    if popularState.movies != nil {
                        MovieBackdropCarouselView(title: "인기 영화", movies: popularState.movies!)
                        
                    } else {
                        LoadingView(isLoading: self.popularState.isLoading, error: self.popularState.error) {
                            self.popularState.loadMovies(with: .popular)
                        }
                    }
                }
                .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 16, trailing: 0))
                
                
                
            }
            .navigationBarTitle("요즘영화뭐가재밋냐 ").font(.caption).navigationBarHidden(true)
            .navigationBarItems(leading:
                HStack{
                    Image("pic").renderingMode(.original).resizable().frame(width: 30, height: 30).cornerRadius(15)

                }
        )

        }
        .onAppear {
            self.nowPlayingState.loadMovies(with: .nowPlaying)
            self.upcomingState.loadMovies(with: .upcoming)
            self.topRatedState.loadMovies(with: .topRated)
            self.popularState.loadMovies(with: .popular)
        }
        
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}

