//
//  CategoryService.swift
//  GoodNews
//

import Foundation

class CategoryService {
    // we'll fire this completion when all the categories has been returned
    func getAllHeadlinesForAllCategories(completion: @escaping ([Category]) -> ()) {
        
        var categories = [Category]() // initialising the category array
        var requestCount = 0
        let categoriesCount = Category.all().count
        
        // iterating over the categories
        Category.all().forEach { category in
            // calling the api request based on the category
            Webservice().load(Article.by(category)) { articles in
                requestCount += 1
                guard let articles = articles else {
                    return
                }
                print("Anoop1:\(articles)")
                // returing an category structure and storing them into the category variable
                // further appending to the local array of type Categroy
                let category = Category(title: category, articles: articles)
                categories.append(category)
                print("Anoop_response:\(categories)")
                if requestCount == categoriesCount { // when the count is equall to the categroy count
                    // we'll return the completion
                    DispatchQueue.main.async {
                        completion(categories)
                    }
                }
            }
        }
    }
    
}
