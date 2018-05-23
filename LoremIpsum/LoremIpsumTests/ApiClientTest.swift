//
//  ApiClientTest.swift
//  LoremIpsumTests
//
//  Created by MKM on 23.05.2018.
//  Copyright © 2018 Tomasz Machlowski. All rights reserved.
//

import XCTest
@testable import LoremIpsum

enum TestError: Error {
    case error
}

class ApiClientTests: XCTestCase {
    
    func testErrorWhileSendingRequest() {
        let urlSessionMock = URLSessionMock()
        urlSessionMock.errorToReturn = TestError.error
        let apiClient = ApiClient(with: urlSessionMock)
        apiClient.send(apiRequest: ImageRequest()) { (response, error) in
            XCTAssertNil(response)
            XCTAssertEqual(error as? TestError, .error)
        }
    }
    
    func testSuccesfulSendRequest() {
        let urlSessionMock = URLSessionMock()

        let data = Data()
        urlSessionMock.dataToReturn = data
        
        let apiClient = ApiClient(with: urlSessionMock)
        apiClient.send(apiRequest: ImageRequest()) { (response: Data?, error: Error?) in
            XCTAssertNotNil(response)
            XCTAssertEqual(response, data)
        }
    }
    
}
