//
//  UIImageView+Extension.swift
//  MeliChallenge
//
//  Created by Leonardo Portes on 18/06/24.
//

import UIKit

private var imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    func load(from urlString: String) {
        image = UIImage(named: "no-image")

        if let img = imageCache.object(forKey: urlString as NSString) {
            image = img as? UIImage
            return
        }

        guard let baseUrl = URL(string: urlString.usingHTTPS()) else {
            return
        }

        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: baseUrl) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        imageCache.setObject(image, forKey: urlString as NSString)
                        self.image = image
                    }
                }
            }
        }
    }
}
