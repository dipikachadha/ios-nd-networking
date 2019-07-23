//
//  DogAPI.swift
//  myRandog
//
//  Created by DCJ Indie Apps on 7/22/19.
//  Copyright © 2019 Dipika Chadha. All rights reserved.
//

import Foundation

class DogAPI {
    enum EndPoint: String {
        case randomImageFromAllDogsCollection = "https://dog.ceo/api/breeds/image/random"
        
        var url: URL {
            return URL(string: self.rawValue)!
        }
    }
}
