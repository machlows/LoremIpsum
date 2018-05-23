//
//  UrlSessionMock.swift
//  LoremIpsumTests
//
//  Created by MKM on 23.05.2018.
//  Copyright © 2018 Tomasz Machlowski. All rights reserved.
//
//

import Foundation

class URLSessionMock: URLSession {
    var dataToReturn: Data?
    var errorToReturn: Error?
    
    override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return URLSessionDataTaskMock {
            completionHandler(self.dataToReturn, nil , self.errorToReturn)
        }
    }
}

class URLSessionDataTaskMock: URLSessionDataTask {
    private let closure: () -> Void
    
    init(closure: @escaping () -> Void) {
        self.closure = closure
    }
    
    override func resume() {
        closure()
    }
}
