//
//  MovieSummary.swift
//  televiUI
//
//  Created by HenriqueLima on 10/01/20.
//  Copyright © 2020 HenriqueLima. All rights reserved.
//

import Foundation

struct MovieSummary: Decodable {
    let id: Int
    let posterURL: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case posterURL = "poster_url"
    }
}
