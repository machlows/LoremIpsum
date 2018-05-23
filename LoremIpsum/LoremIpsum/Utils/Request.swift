//
//  Request.swift
//  LoremIpsum
//
//  Created by MKM on 22.05.2018.
//  Copyright © 2018 Tomasz Machlowski. All rights reserved.
//

import Foundation

protocol Request {
    var path: URL { get }
}

extension Request {
    func request() -> URLRequest {
        return URLRequest(url: path)
    }
}

class ImageRequest: Request {
    private let userDefaultsHelper: UserDefaultsHelper
    
    init(with userDefaultsHelper: UserDefaultsHelper = UserDefaultsHelper()) {
        self.userDefaultsHelper = userDefaultsHelper
    }
    
    var path: URL{
        let counter = userDefaultsHelper.getImageRequestCounter()
        let pathString = counter % 5 == 4 ? "0000" : "https://picsum.photos/200/300/?random"
        return URL(string: pathString)!
    }
    
}
