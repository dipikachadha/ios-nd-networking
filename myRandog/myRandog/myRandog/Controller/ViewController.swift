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

    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var imageView: UIImageView!
    let breeds: [String] = ["cairn", "corgi", "husky"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pickerView.dataSource = self
        pickerView.delegate = self

        // No longer needed -- call made at pickerView scroll
        // DogAPI.requestRandomImage(
        //    completionHandler: self.handleRandomImageResponse(dogImage:error:))
    }

    func handleRandomImageResponse(dogImage: DogImage?, error: Error?) {
        guard let dogImage = dogImage else { return }
        
        guard let imageUrl: URL = URL(string: dogImage.message) else {
            return
        }
        
        DogAPI.requestImageFile(url: imageUrl, completionHandler:
            self.handleImageFileResponse(image:error:))
    }
    
    func handleImageFileResponse(image: UIImage?, error: Error?) {
        DispatchQueue.main.async {
            self.imageView.image = image
        }
    }
}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int { return 1 }
    
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        return breeds.count
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        return breeds[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int,
                    inComponent component: Int) {
        print("Fetching image for \(breeds[row])")
        DogAPI.requestRandomImage(breed: breeds[row], completionHandler:
            self.handleRandomImageResponse(dogImage:error:))
    }
}
