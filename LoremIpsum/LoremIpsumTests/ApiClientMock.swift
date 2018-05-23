//
//  ApiClientMock.swift
//  LoremIpsumTests
//
//  Created by MKM on 23.05.2018.
//  Copyright © 2018 Tomasz Machlowski. All rights reserved.
//

import Foundation
@testable import LoremIpsum
class ApiClientMock: ApiClient {
    var dataToReturn: Data?
    var errorToReturn: Error?
    var responseToReturn: URLResponse?
    
    override func send(apiRequest: Request, completition: @escaping ((Data?, Error?) -> Void)) {
        completition(dataToReturn, errorToReturn)
    }
}
