//
//  Movie.swift
//  televiUI
//
//  Created by HenriqueLima on 13/01/20.
//  Copyright © 2020 HenriqueLima. All rights reserved.
//

import Foundation

struct Movie: Decodable {
    let title: String
    let releaseDate: String
    let overview: String
    let imageURL: String
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case releaseDate = "release_date"
        case overview = "overview"
        case imageURL = "backdrop_url"
    }
}

