//
//  Category.swift
//  GoodNews
//
//

import Foundation

// this model is a category model where
// every every category will be having articles

struct Category {
    let title: String
    let articles: [Article]
    
    // for all is used to iterate through the categories
    static func all() -> [String] {
        return ["Business","Entertainment","General","Sports"]
    }
}
