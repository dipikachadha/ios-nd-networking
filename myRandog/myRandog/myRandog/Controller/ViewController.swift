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
        let randomImageEndPoint = DogAPI.EndPoint.randomImageFromAllDogsCollection.url
        let task = URLSession.shared.dataTask(with: randomImageEndPoint) { (data, response, error) in
            guard let data = data else {
                return
            }
            print(data)
        }
        task.resume()
    }


}

