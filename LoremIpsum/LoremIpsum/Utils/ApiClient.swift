//
//  ApiClient.swift
//  LoremIpsum
//
//  Created by MKM on 22.05.2018.
//  Copyright © 2018 Tomasz Machlowski. All rights reserved.
//

import Foundation
//
//  ApiClient.swift
//  foursquareTestApp
//
//  Created by MKM on 16.05.2018.
//  Copyright © 2018 Tomasz Machlowski. All rights reserved.
//

import Foundation

enum NetworkingError: Error {
    case unexpectedError
}

class ApiClient {
    private var urlSession: URLSession
    private let userDefaultsHelper: UserDefaultsHelper
    
    init(with session: URLSession = URLSession.shared, userDefaultsHelper: UserDefaultsHelper = UserDefaultsHelper()) {
        self.urlSession = session
        self.userDefaultsHelper = userDefaultsHelper
    }
    
    func send(apiRequest: Request, completition: @escaping ((_ result: Data?, _ error: Error?) -> Void) )  {
        let request = apiRequest.request()
        let task = self.urlSession.dataTask(with: request) { (data, response, error) in
            if apiRequest is ImageRequest {
                self.userDefaultsHelper.increaseImageCounterValue()
            }
            if let error = error {
                completition(nil, error)
            } else {
                guard let response = response as? HTTPURLResponse else {
                    fatalError("Couldn't get HTTP response")
                }
                if 200 ..< 300 ~= response.statusCode {
                    completition(data, nil)
                }
                else {
                    completition(nil,NetworkingError.unexpectedError)
                }
            }
        }
        task.resume()
    }
}
