//
//  SearchResultCoordinator.swift
//  MeliChallenge
//
//  Created by Leonardo Portes on 17/06/24.
//

import UIKit

final class SearchResultCoordinator: BaseCoordinator {
    func start(searchText: String) {
        let viewModel = SearchResultViewModel(coordinator: self)
        let controller = SearchResultController(viewModel: viewModel, coordinator: self, searchText: searchText)
        configuration.viewController = controller
        configuration.navigationController?.navigationBar.topItem?.backButtonDisplayMode = .minimal
        configuration.navigationController?.pushViewController(controller, animated: true)
    }

    func navigateToProductList() {

    }
}
