//
//  ViewController.swift
//  LoremIpsum
//
//  Created by MKM on 22.05.2018.
//  Copyright © 2018 Tomasz Machlowski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var infoLabel: UILabel!
    
    var timer: Timer!
    var viewModel: MainViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = MainViewModel()
        scheduledTimerWithTimeInterval()
        
    }
    
    func scheduledTimerWithTimeInterval() {
         timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { (_) in
            self.fetchImage()
        }
    }

    @objc func fetchImage() {
        infoLabel.text = "Loading...."
        viewModel.fetchImage {[weak self] (image, text) in
            DispatchQueue.main.async {
                self?.imageView.image = image
                self?.infoLabel.text = text
            }
        }
    }
}

