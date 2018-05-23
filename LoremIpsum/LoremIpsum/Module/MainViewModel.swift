//
//  MainViewModel.swift
//  LoremIpsum
//
//  Created by MKM on 22.05.2018.
//  Copyright © 2018 Tomasz Machlowski. All rights reserved.
//

import UIKit

typealias ImageResponseClosure = (UIImage?,String) -> Void

struct MainViewModel {
    var apiClient: ApiClient
    
    init(with apiClient: ApiClient = ApiClient()) {
        self.apiClient = apiClient
    }
    
    func fetchImage(with completion: @escaping ImageResponseClosure)  {
        let imageRequest = ImageRequest()
        let start = Date()
        apiClient.send(apiRequest: imageRequest) { (imageData, error) in
            if let imagedata = imageData, let image = UIImage(data: imagedata) {
                let end = Date()
                let timeInteraval = end.timeIntervalSince(start)
                completion(image, "\(timeInteraval)")
            }
            
            if let _ = error {
                completion(UIImage(named: "errorImage"),"Oh nooo")
            }
        }
    }
}
