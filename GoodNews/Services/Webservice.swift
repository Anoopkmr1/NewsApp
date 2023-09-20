//
//  Webservice.swift
//  GoodNews
//
//  Created by Mohammad Azam on 1/21/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import Foundation

struct Resource<T> {
    let url: URL
    let parse: (Data) -> T?
}

class Webservice {
    
    // function is used for API call
    func load<T>(_ resource: Resource<T>, completion: @escaping (T?) -> ()) {
        
        URLSession.shared.dataTask(with: resource.url) { data, response, error in
            if let data = data {
                DispatchQueue.main.async {
                    completion(resource.parse(data))
                }
            } else {
                completion(nil)
            }
            
        }.resume()
        
    }
    
}
