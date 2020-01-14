//
//  MovieDetailVM.swift
//  televiUI
//
//  Created by HenriqueLima on 13/01/20.
//  Copyright © 2020 HenriqueLima. All rights reserved.
//

import Foundation


struct MovieDetailVM {
    struct Movie {
        let title: String
        let releaseDate: String
        let overview: String
        let imageURL: String
    }
}


/// Mark: Mappers
extension Movie {
    func toViewModel() -> MovieDetailVM.Movie {
        return .init(title: title, releaseDate: releaseDate, overview: overview, imageURL: imageURL)
    }
}
