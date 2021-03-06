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
        GeometryReader { geo in
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(self.movies.chunked(into: self.collumns), id: \.self) { movies in
                        MovieRow(movies: movies)
                    }
                }.frame(width: geo.size.width)
            }
        }
    }
}
