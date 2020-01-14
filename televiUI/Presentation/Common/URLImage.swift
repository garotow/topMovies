//
//  ImageLoader.swift
//  televiUI
//
//  Created by HenriqueLima on 10/01/20.
//  Copyright © 2020 HenriqueLima. All rights reserved.
//

import SwiftUI
import Combine

enum ImageError: Error {
    case missingData
    case invalidData
}

struct URLImage: View {
    
    @State var cancellable: AnyCancellable?
    var imageURL: URL?
    var placeholder: UIImage?
    @State var image: UIImage = {
        guard let image = UIImage(named: "filme1") else {
            return UIImage()
        }
        return image
        
    }()
    
    init(url: URL?) {
        self.imageURL = url
    }
    
    var body: some View {
       Image(uiImage: image)
                .renderingMode(.original)
                .resizable()
            .onAppear() {
                self.loadImage()
            }
        
    }
    
    func loadImage() {
        guard let url = imageURL else { return }
        
        cancellable = URLSession
        .shared
        .dataTaskPublisher(for: url)
        .tryMap { data, _ in
            guard let image = UIImage(data: data) else {
                throw ImageError.invalidData
            }
            
            return image
        }
        .receive(on: DispatchQueue.main)
        .sink(
            receiveCompletion: { _ in },
            receiveValue: { image in
                self.image = image
            }
        )
    }
}

struct ImageLoader_Previews: PreviewProvider {
    static var previews: some View {
        URLImage(url: nil)
    }
}
