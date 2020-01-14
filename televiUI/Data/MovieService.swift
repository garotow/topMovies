//
//  MovieService.swift
//  televiUI
//
//  Created by HenriqueLima on 10/01/20.
//  Copyright © 2020 HenriqueLima. All rights reserved.
//

import Foundation
import Combine

enum DomainError: Error {
    case invalid
}

class MovieService {
    
    var movieListPath: String { return "https://desafio-mobile.nyc3.digitaloceanspaces.com/movies" }
    var movieDetailPath: String { return "https://desafio-mobile.nyc3.digitaloceanspaces.com/movies/"}
    
    func fetchMovieList() -> AnyPublisher<[MovieSummary], DomainError> {
        let movieListURL = URL(string: movieListPath)!
        var request = URLRequest(url: movieListURL)
        request.httpMethod = "get"
        
       return URLSession
        .shared
        .dataTaskPublisher(for: request)
        .map { (data, _) in
            return data
        }
        .decode(type: [MovieSummary].self, decoder: JSONDecoder())
        .mapError { error in
            print(error)
            return DomainError.invalid
        }
        .eraseToAnyPublisher()
    }
    
    func fetchMovieDetail(id: Int) -> AnyPublisher<Movie, DomainError> {
        let movieDetailURL = URL(string: movieDetailPath + "\(id)")!
        var request = URLRequest(url: movieDetailURL)
        request.httpMethod = "get"
        
        return URLSession
            .shared
            .dataTaskPublisher(for: request)
            .map { (data, _) in
                return data
            }
            .decode(type: Movie.self, decoder: JSONDecoder())
            .mapError { error in
                print(error)
                return DomainError.invalid
            }
            .eraseToAnyPublisher()
    }
    
    
}
