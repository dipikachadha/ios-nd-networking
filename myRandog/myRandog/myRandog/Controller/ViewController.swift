//
//  ViewController.swift
//  myRandog
//
//  Created by DCJ Indie Apps on 7/22/19.
//  Copyright © 2019 Dipika Chadha. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        DogAPI.requestRandomImage(
            completionHandler: self.handleRandomImageResponse(dogImage:error:))
    }

    func handleRandomImageResponse(dogImage: DogImage?, error: Error?) {
        guard let dogImage = dogImage else { return }
        
        guard let imageUrl: URL = URL(string: dogImage.message) else {
            return
        }
        
        DogAPI.requestImageFile(url: imageUrl, completionHandler: self.handleImageFileResponse(image:error:))
    }
    
    func handleImageFileResponse(image: UIImage?, error: Error?) {
        DispatchQueue.main.async {
            self.imageView.image = image
        }
    }
}

