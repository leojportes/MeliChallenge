//
//  MockURLSession.swift
//  MeliChallengeTests
//
//  Created by Leonardo Portes on 20/06/24.
//

import Foundation

@testable import MeliChallenge

class MockURLSession: URLSession {
    var nextData: Data?
    var nextError: Error?
    var nextResponse: URLResponse?

    override func dataTask(
        with request: URLRequest,
        completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void
    ) -> URLSessionDataTask {
        return MockURLSessionDataTask {
            completionHandler(self.nextData, self.nextResponse, self.nextError)
        }
    }
}

class MockURLSessionDataTask: URLSessionDataTask {
    private let closure: () -> Void

    init(closure: @escaping () -> Void) {
        self.closure = closure
    }

    override func resume() {
        closure()
    }
}
