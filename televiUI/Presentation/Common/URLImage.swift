//
//  ImageLoader.swift
//  televiUI
//
//  Created by HenriqueLima on 10/01/20.
//  Copyright © 2020 HenriqueLima. All rights reserved.
//

import SwiftUI
import Combine

struct URLImage: View {
    var imageURL: URL?
    
    @ObservedObject var imageLoader: ImageLoader
    
    init(url: URL?) {
        self.imageURL = url
        self.imageLoader = ImageLoader(url: url)
    }
    
    var body: some View {
        VStack {
            imageLoader.image.map { AnyView(Image(uiImage: $0).renderingMode(.original).resizable())} ?? AnyView(Rectangle().fill(Color.gray))
        }.onAppear(perform: imageLoader.loadImage)
    }
}

struct ImageLoader_Previews: PreviewProvider {
    static var previews: some View {
        URLImage(url: nil)
    }
}
