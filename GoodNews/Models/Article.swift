//
//  Article.swift
//  GoodNews
//

//

import Foundation


// this is the root model
struct NewsSourcesResponse: Decodable {
    let articles: [Article]
}

// this comes under the root model which
// will provide the relevant information
struct Article: Decodable {
    
    let title: String
    let description: String?
    let url: String?
    let imageURL: String?
    let sourceName: String
    
    private enum ArticleKeys: String, CodingKey {
        case title
        case description
        case url
        case imageURL = "urlToImage"
        case source
    }
    
    private enum SourceKeys: String, CodingKey {
        case name
    }
    
    // selft json parsing
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ArticleKeys.self)
        self.title = try container.decode(String.self, forKey: .title)
        self.description = try? container.decode(String.self, forKey: .description)
        self.url = try? container.decode(String.self, forKey: .url)
        self.imageURL = try? container.decode(String.self, forKey: .imageURL)
        
        let sourceContainer = try container.nestedContainer(keyedBy: SourceKeys.self, forKey: .source)
        self.sourceName = try sourceContainer.decode(String.self, forKey: .name)
    }
    
}

extension Article {
    // this function is used for mapping the data to the model from the provided url
    static func by(_ category: String) -> Resource<[Article]> {
        return Resource<[Article]>(url: URL.urlForTopHeadlines(for: category)) { data in
            print("\(data)")
            return try! JSONDecoder().decode(NewsSourcesResponse.self, from: data).articles
        }
    }
}
