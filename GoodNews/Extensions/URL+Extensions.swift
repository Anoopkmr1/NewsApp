//
//  URL+Extensions.swift
//  GoodNews

//

import Foundation

extension URL {
    // used to fetch the data based on the category
    static func urlForTopHeadlines(for category: String) -> URL {
        return URL(string: "https://newsapi.org/v2/top-headlines?category=\(category)&country=us&apiKey=0cf790498275413a9247f8b94b3843fd")!
    }
    
}
