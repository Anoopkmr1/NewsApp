//
//  UIImage+Extensions.swift
//  GoodNews
//

//

import Foundation
import UIKit

extension UIImage {
    
    // if image is not found then use the placeholder image
    static func imageForPlaceHolder() -> UIImage {
        return UIImage(named: "placeholder")!
    }
    
    // function used to download the image from the url
    static func imageForHeadline(url: String, completion: @escaping (UIImage) -> ()) {
        
        guard let imageURL = URL(string: url) else {
            completion(UIImage.imageForPlaceHolder())
            return
        }
        // url is converted to the data format and then image is retrieved from there
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: imageURL) {
                if let downloadImage = UIImage(data: data) {
                    completion(downloadImage)
                }
            }
        }
        
    }
    
}
