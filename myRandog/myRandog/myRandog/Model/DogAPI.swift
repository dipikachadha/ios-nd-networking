//
//  DogAPI.swift
//  myRandog
//
//  Created by DCJ Indie Apps on 7/22/19.
//  Copyright © 2019 Dipika Chadha. All rights reserved.
//

import Foundation
import UIKit

class DogAPI {
    enum EndPoint: String {
        case randomImageFromAllDogsCollection = "https://dog.ceo/api/breeds/image/random"
        
        var url: URL {
            return URL(string: self.rawValue)!
        }
    }
    
    class func requestImageFile
        (url: URL, completionHandler: @escaping (UIImage?, Error?) -> Void)
        -> Void {
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, err) in
            guard let data = data else {
                completionHandler(nil, err)
                return
            }
            
            let image = UIImage(data: data)
            completionHandler(image, nil)
        })
        task.resume()
    }
    
    class func requestRandomImage
        (completionHandler: @escaping (DogImage?, Error?) -> Void) -> Void {
        let randomImageEndPoint =
            DogAPI.EndPoint.randomImageFromAllDogsCollection.url
        
        let task = URLSession.shared.dataTask(with: randomImageEndPoint) {
            (data, response, error) in
            guard let data = data else {
                completionHandler(nil, error)
                return
            }
            let decoder = JSONDecoder()
            do {
                try completionHandler(decoder.decode(DogImage.self, from: data), nil)
            } catch {
                completionHandler(nil, error)
            }
        }
        task.resume()
    }
}
