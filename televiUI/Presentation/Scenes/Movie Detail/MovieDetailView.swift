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
    
    @ObservedObject var viewModel = MovieDetailViewModel()
    
    var body: some View {
        ScrollView {
            URLImage(url: URL(string:""))
                .frame(height: 300.0)
            
            VStack(spacing: 5.0) {
                // Title
                HStack {
                    Text("Title:")
                        .fontWeight(.semibold)
                    Text(viewModel.movie.title)
                    Spacer()
                }
            
                // Release Date
                HStack {
                    Text("Release Date:")
                        .fontWeight(.semibold)
                    Text(viewModel.movie.releaseDate)
                    Spacer()
                    
                }
                // Overview
                HStack {
                    Text("Overview:")
                        .fontWeight(.semibold)
                    Spacer()
                }
                Text(viewModel.movie.overview)
                Spacer()
            }.padding()
        }
        .navigationBarTitle("\(viewModel.movie.title)", displayMode: .inline)
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
