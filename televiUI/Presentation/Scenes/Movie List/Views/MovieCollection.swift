//
//  MovieCollection.swift
//  televiUI
//
//  Created by HenriqueLima on 10/01/20.
//  Copyright © 2020 HenriqueLima. All rights reserved.
//

import SwiftUI
import Combine

struct MovieCollection: View {
    
    var movies: [MovieListVM.Movie]
    let collumns: Int = 3
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                ForEach(movies.chunked(into: collumns), id: \.self) { movies in
                    MovieRow(movies: movies)
                }
            }
        }
    }
}
