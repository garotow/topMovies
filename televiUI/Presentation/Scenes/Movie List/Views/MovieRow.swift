//
//  MovieRow.swift
//  televiUI
//
//  Created by HenriqueLima on 09/01/20.
//  Copyright © 2020 HenriqueLima. All rights reserved.
//

import SwiftUI

struct MovieRow: View {
    
    /// Mark: Constants
    var itemsPerRow: Int { min(movies.count, maxItems) }
    let maxItems: Int = 3
    let itemHeight: CGFloat = 150.0
    let spacing: Int = 10
    
    let movies: [MovieListVM.Movie]

    var body: some View {
       GeometryReader { geo in
            HStack() {
                ForEach(0 ..< self.itemsPerRow) { index in
                    MovieCell(movie: self.movies[index])
                        .frame(width: self.itemWidth(screenWidth: geo.size.width), height: self.itemHeight)
                }
            }.padding([.horizontal], CGFloat(self.spacing))
       }.frame(height: itemHeight)
    }
    
    func itemWidth(screenWidth width: CGFloat) -> CGFloat {
        let totalSpacing = CGFloat((maxItems + 1) * spacing)
        let itemWidth = (width - totalSpacing) / CGFloat(maxItems)
        return itemWidth
    }
}

