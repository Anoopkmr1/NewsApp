//
//  ArticleViewModel.swift
//  GoodNews
//
//

import Foundation
import UIKit

struct ArticleViewModel {
    private(set) var article: Article
}

extension ArticleViewModel {
    init(_ article: Article) {
        self.article = article
    }
}

extension ArticleViewModel {
    
    var title: String {
        return self.article.title
    }
    
    var description: String? {
        return self.article.description
    }
    
    // function used to pass the image to the article section
    func image(completion: @escaping (UIImage?) -> ()) {
        
        guard let imageURL = article.imageURL else {
            completion(nil)
            return
        }
        
        UIImage.imageForHeadline(url: imageURL) { image in
            DispatchQueue.main.async {
                completion(image)
            }
        }
        
        
    }
    
}
