//
//  SearchViewModelTests.swift
//  MeliChallengeTests
//
//  Created by Leonardo Portes on 16/06/24.
//

import XCTest
@testable import MeliChallenge

final class SearchViewModelTests: XCTestCase {
    private var sut: SearchViewModel!
    private var coordinator: SearchCoordinator!

    override func setUp() {
        super.setUp()
        coordinator = .init(with: .init(navigationController: .init()))
        sut = .init(coordinator: coordinator)
    }

    override func tearDown() {
        super.tearDown()
        coordinator = nil
        sut = nil
    }

    func test_searchViewModel_whenNavigateToProductList_thenShouldHaveCorrectController() throws {
        // When
        sut.navigateToProductList("")

        let currentController = sut.coordinator?.configuration.navigationController?.viewControllers.last
        XCTAssertTrue(currentController is ProductListController)
    }
}
