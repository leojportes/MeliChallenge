//
//  APIClientTests.swift
//  MeliChallengeTests
//
//  Created by Leonardo Portes on 20/06/24.
//

import XCTest
@testable import MeliChallenge

final class APIClientTests: XCTestCase {

    func test_fetch_givenResponseMock_whenFetch_shouldReturnExpectedModel() {
        // Given
        let session = MockURLSession()
        session.nextData = Self.responseMock

        session.nextResponse = HTTPURLResponse(
            url: URL(string: "https://api.test.com")!,
            statusCode: 200,
            httpVersion: nil,
            headerFields: nil
        )

        let apiClient = ApiClient(session: session)
        let endpoint = Endpoint(path: "https://api.test.com", query: [])
        let expectation = self.expectation(description: "Completion handler invoked")
        let responseMock: ProductListResponse = .stub()

        // When
        apiClient.fetch(model: ProductListResponse.self, request: endpoint) { result in
            switch result {
            case .success(let model):
                // Then
                XCTAssertEqual(model, responseMock)

            case .failure(let error):
                // Then
                XCTFail("error: \(error)")
            }
            expectation.fulfill()
        }

        waitForExpectations(timeout: 1, handler: nil)
    }

    func test_fetch_givenError_whenFetch_shouldReturnExpectedError() {
        // Given
        let session = MockURLSession()
        session.nextError = NSError(domain: "TestError", code: -1, userInfo: nil)

        let apiClient = ApiClient(session: session)
        let endpoint = Endpoint(path: "https://api.test.com", query: [])
        let expectation = self.expectation(description: "Completion handler invoked")

        // When
        apiClient.fetch(model: ProductListResponse.self, request: endpoint) { result in
            switch result {
            case .success(let model):
                // Then
                XCTFail("Expected failure, but got success with model: \(model)")

            case .failure(let error):
                // Then
                XCTAssertNotNil(error)
            }
            expectation.fulfill()
        }

        waitForExpectations(timeout: 1, handler: nil)
    }
}
