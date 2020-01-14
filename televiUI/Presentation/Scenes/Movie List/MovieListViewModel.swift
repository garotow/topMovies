//
//  MovieListViewModel.swift
//  televiUI
//
//  Created by HenriqueLima on 10/01/20.
//  Copyright © 2020 HenriqueLima. All rights reserved.
//

import Foundation
import Combine

class MovieListViewModel: ObservableObject {
    
    var disposeBag: Cancellable?
    let movieService = MovieService()
    
    @Published private(set) var movies: [MovieListVM.Movie] = [] //[MovieListVM.Movie(id: 0, imageURL: nil)]
    
    func loadMovies() {
        disposeBag = movieService.fetchMovieList()
            .map {$0.toViewModel()}
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }) { movies in
                self.movies = movies
            }
    }
    
    deinit {
        disposeBag?.cancel()
    }
}
