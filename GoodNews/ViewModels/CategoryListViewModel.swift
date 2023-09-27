//
//  CategoryListViewModel.swift
//  GoodNews

//

import Foundation
import UIKit

class CategoryListViewModel: NSObject {
    // categroy view model
    var categories: [Category]
    init(categories: [Category]) {
        self.categories = categories
    }
    
    var numberOfSections: Int { // section in the categroy view model
        return self.categories.count
    }
    func numberOfRowsInSection(_ section: Int) -> Int { // rows in every section in  view model
        return self.categories[section].articles.count
    }
    func heightForHeaderInSection(_ section: Int) -> CGFloat {  // height for the header
        return 60.0
    }

    func categoryAtIndex(index: Int) -> CategoryViewModel {
        return CategoryViewModel(name: categories[index].title, articles: categories[index].articles)
    }
    // we need article in every section
    func articleForSectionAtIndex(section: Int, index: Int) -> ArticleViewModel {
        return categoryAtIndex(index: section).articleAtIndex(index)
    }
    
}

// responsible for the categories, assosiated with the arcticles
struct CategoryViewModel {
    let name: String  // entertainment, bussiness
    let articles: [Article]  // article array
    
    func articleAtIndex(_ index: Int) -> ArticleViewModel {
        let article = self.articles[index]
        return ArticleViewModel(article)
    }
}

