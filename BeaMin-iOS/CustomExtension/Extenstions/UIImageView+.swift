//
//  UIImageView+.swift
//  CustomExtension
//
//  Created by uiskim on 2023/05/26.
//

import UIKit

private class ImageCacheManager {
  static let shared = NSCache<NSString, UIImage>()
  private init() { }
}

extension UIImageView {
    
    public func loadImage(from urlString: String) -> URLSessionDataTask? {
        guard let url = URL(string: urlString) else { return nil }
        self.image = nil
        if let cachedImage = ImageCacheManager.shared.object(forKey: urlString as NSString) {
            self.image = cachedImage
            return nil
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil { return }
            guard let data = data else { return }
            DispatchQueue.main.async {
                guard let img = UIImage(data: data) else { return }
                ImageCacheManager.shared.setObject(img, forKey: urlString as NSString)
                self.image = img
            }
        }
        task.resume()
        return task
    }
}

