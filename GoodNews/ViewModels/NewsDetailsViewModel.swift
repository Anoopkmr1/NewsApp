//
//  NewsDetailsViewModel.swift
//  GoodNews

import Foundation

class NewsDetailsViewModel {
    let article: Article

    init(_ article: Article) {
        self.article = article
    }
    
    var sourceName: String {
        return self.article.sourceName
    }
    
    var url: String? {
        return self.article.url
    }
    
}


