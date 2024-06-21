//
//  EndpointsTests.swift
//  MeliChallengeTests
//
//  Created by Leonardo Portes on 20/06/24.
//

import XCTest
@testable import MeliChallenge

final class EndpointsTests: XCTestCase {
    
    func test_getSearchResult_givenMockEndpoint_shouldReturnEqual() {
        // Given
        let endpoint = Endpoints
            .getSearchResult(
                request: .init(searchText: "", offset: 0)
            )

        // Then
        XCTAssertEqual(endpoint.path, "https://api.mercadolibre.com/sites/MLB/search")
        XCTAssertEqual(endpoint.method, .get)
    }
}
