//
//  NewsDetailsViewModel.swift
//  GoodNews
//
//  Created by Mohammad Azam on 1/23/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import Foundation

struct NewsDetailsViewModel {
    let article: Article
}

extension NewsDetailsViewModel {
    init(_ article: Article) {
        self.article = article
    }
}

extension NewsDetailsViewModel {
    
    var sourceName: String {
        return self.article.sourceName
    }
    
    var url: String? {
        return self.article.url
    }
    
}


