//
//  SearchViewControllerTests.swift
//  MeliChallengeTests
//
//  Created by Leonardo Portes on 20/06/24.
//

import SnapshotTesting
import XCTest

@testable import MeliChallenge

class SearchViewControllerTests: XCTestCase {
    func test_searchViewController_shouldReturnExpectedSnapshot() {
        let sut = makeSut()
        assertSnapshot(of: sut, as: .image, record: false)
    }
}

extension SearchViewControllerTests {
    func makeSut() -> SearchViewController {
        SearchViewController(
            viewModel: SearchViewModel(
                coordinator: .init(
                    with: .init(
                        navigationController: .init()
                    )
                )
            ),
            coordinator: SearchCoordinator(
                with: .init(
                    navigationController: .init()
                )
            )
        )
    }
}
