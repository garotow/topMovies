//
//  MovieDetailsView.swift
//  televiUI
//
//  Created by HenriqueLima on 13/01/20.
//  Copyright © 2020 HenriqueLima. All rights reserved.
//

import SwiftUI

struct MovieDetailView: View {
    var id: Int
    var viewModel = MovieDetailViewModel()
    
    var body: some View {
        VStack {
            URLImage(url: URL(string:""))
                .frame(height: 300.0)
            // Line 1
            HStack {
                Text("Title:")
                Text(viewModel.movie.title)
                Spacer()
            }
            // Line 2
            HStack {
                Text("Release Date:")
                Text(viewModel.movie.releaseDate)
                Spacer()
                
            }
            // Line 3
            HStack {
                Text("Overview:")
                Spacer()
            }
            Text(viewModel.movie.overview)
            Spacer()
        }.padding()
        .navigationBarTitle(viewModel.movie.title)
        .onAppear {
            self.viewModel.loadMovieDetail(id: self.id)
        }
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(id: 1)
    }
}
