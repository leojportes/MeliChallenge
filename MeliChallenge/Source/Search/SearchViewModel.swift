//
//  SearchViewModel.swift
//  MeliChallenge
//
//  Created by Leonardo Portes on 16/06/24.
//

import Foundation

protocol SearchViewModelProtocol: AnyObject {
    func navigateToSearchResult(_ searchText: String)
}

final class SearchViewModel: SearchViewModelProtocol {
    // MARK: - Properties
    private(set) var coordinator: SearchCoordinator?

    // MARK: - Init
    init(coordinator: SearchCoordinator?) {
        self.coordinator = coordinator
    }

    // MARK: - Routes
    func navigateToSearchResult(_ searchText: String) {
        coordinator?.navigateToSearchResult(searchText: searchText)
    }
}
