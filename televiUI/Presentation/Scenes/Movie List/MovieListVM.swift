//
//  MovieListVM.swift
//  televiUI
//
//  Created by HenriqueLima on 09/01/20.
//  Copyright © 2020 HenriqueLima. All rights reserved.
//

import Foundation

struct MovieListVM {
    struct Movie: Hashable {
        let id: Int
        let imageURL: URL?
    }
}


/// Mark: Mappers: Domain -> View Model
extension Array where Element == MovieSummary {
    func toViewModel() -> [MovieListVM.Movie] {
        return map { $0.toViewModel() }
    }
}

extension MovieSummary {
    func toViewModel() -> MovieListVM.Movie {
        return .init(id: id, imageURL: URL(string: posterURL))
    }
}
