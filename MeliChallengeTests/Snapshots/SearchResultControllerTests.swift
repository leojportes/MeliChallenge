//
//  SearchResultControllerTests.swift
//  MeliChallengeTests
//
//  Created by Leonardo Portes on 20/06/24.
//

import SnapshotTesting
import XCTest

@testable import MeliChallenge

class SearchResultControllerTests: XCTestCase {
    func test_searchResultController_shouldReturnExpectedSnapshot() {
        let sut = makeSut()
        sut.rootView.products = [
            .stub(),
            .stub(),
            .stub(),
            .stub(),
            .stub(),
        ]
        sut.rootView.numberOfResults = 1345
        assertSnapshot(of: sut, as: .image, record: true)
    }
}

extension SearchResultControllerTests {
    func makeSut() -> SearchResultController {
        SearchResultController(
            viewModel: SearchResultViewModel(
                coordinator: .init(
                    with: .init(
                        navigationController: .init()
                    )
                )
            ),
            coordinator: SearchResultCoordinator(
                with: .init(
                    navigationController: .init()
                )
            ), 
            searchText: "IPhone 15"
        )
    }
}
