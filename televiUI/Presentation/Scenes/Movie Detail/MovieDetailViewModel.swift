//
//  MovieDetailViewModel.swift
//  televiUI
//
//  Created by HenriqueLima on 13/01/20.
//  Copyright © 2020 HenriqueLima. All rights reserved.
//

import Foundation
import Combine

class MovieDetailViewModel: ObservableObject {
    
    var disposeBag: Cancellable?
    let movieService = MovieService()
    
    @Published private(set) var movie: MovieDetailVM.Movie = MovieDetailVM.Movie.init(title: "", releaseDate: "", overview: "", imageURL: "")
    
    func loadMovieDetail(id: Int) {
        disposeBag = movieService.fetchMovieDetail(id: id)
            .map {$0.toViewModel()}
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }) { movie in
                self.movie = movie
            }
    }
    
    deinit {
        disposeBag?.cancel()
    }
}
