//
//  MovieCell.swift
//  televiUI
//
//  Created by HenriqueLima on 09/01/20.
//  Copyright © 2020 HenriqueLima. All rights reserved.
//

import SwiftUI

struct MovieCell: View {
    var movie: MovieListVM.Movie

    var body: some View {
        NavigationLink(destination: MovieDetailView(id: movie.id)) {
          URLImage(url: movie.imageURL)
        }
    }
    
}
