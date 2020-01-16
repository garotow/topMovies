//
//  ImageLoader.swift
//  televiUI
//
//  Created by HenriqueLima on 15/01/20.
//  Copyright © 2020 HenriqueLima. All rights reserved.
//

import UIKit
import Combine

enum ImageError: Error {
    case missingData
    case invalidData
}

class ImageLoader: ObservableObject {
    var cancellable: AnyCancellable?
    var imageURL: URL?
    var placeholder: UIImage?
    
    @Published var image: UIImage?
    
    init(url: URL?) {
        self.imageURL = url
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
