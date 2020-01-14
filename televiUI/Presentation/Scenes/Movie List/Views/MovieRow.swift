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
    let spacing: CGFloat = 10
    
    let movies: [MovieListVM.Movie]

    var body: some View {
        GeometryReader { geo in
            HStack(spacing: self.spacing) {
                ForEach(0 ..< self.itemsPerRow) { index in
                    MovieCell(movie: self.movies[index])
                        .frame(width: self.itemWidth(screenWidth: geo.size.width), height: self.itemHeight)
                 }
                if self.itemsPerRow < self.maxItems {
                  Spacer()
                }
            }.padding([.horizontal], self.spacing)
            .frame(width: geo.size.width)
            
               
        }.frame(height: self.itemHeight)
    }
    
    func itemWidth(screenWidth width: CGFloat) -> CGFloat {
        let totalSpacing = CGFloat(maxItems + 1) * spacing
        let itemWidth = (width - totalSpacing) / CGFloat(maxItems)
        return itemWidth
    }
}
