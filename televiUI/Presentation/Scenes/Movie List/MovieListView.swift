//
//  ContentView.swift
//  televiUI
//
//  Created by HenriqueLima on 08/01/20.
//  Copyright © 2020 HenriqueLima. All rights reserved.
//

import SwiftUI
import Combine

struct MovieListView: View {
    
    @ObservedObject var viewModel = MovieListViewModel()
    
    var body: some View {
        NavigationView {
            MovieCollection(movies: viewModel.movies)
                .navigationBarTitle("Movies")
        }.onAppear{ self.viewModel.loadMovies() }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
