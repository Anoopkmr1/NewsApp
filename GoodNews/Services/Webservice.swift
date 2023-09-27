//
//  Webservice.swift
//  GoodNews

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
                    completion(resource.parse(data))
            } else {
                completion(nil)
            }
            
        }.resume()
    }

}
